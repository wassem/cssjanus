# Copyright 2008 Google Inc. All Rights Reserved.

"""Django controllers for CSS Janus."""

__author__ = 'elsigh@google.com (Lindsey Simon)'

import logging
import re
import urllib

from django.shortcuts import render_to_response
from django.http import HttpResponse

import cssjanus

# Thsi regex is for splitting textarea input.
NEWLINE_RE = re.compile(r'[\n]')

def index(request):
  """CSS Janus web form handler."""
  
  if request.method == 'GET':
    logging.debug('Starting cssjanus GET processing')
    return render_to_response('cssjanus.tpl', {})

  else:
    logging.debug('Starting cssjanus POST processing')
    csstext = request.REQUEST['csstext']
    cssuri = request.REQUEST['cssuri']
    message = ''
    
    flags = ParseFlags(request)
    swap_ltr_rtl_in_url = flags[0]
    swap_left_right_in_url = flags[1]
    
    # If they type something in the free text field, that overrides uri.
    if csstext:
      logging.info('Processing raw CSS text')
      lines = NEWLINE_RE.split(csstext)
    
    # If they typed into the CSS uri field, grab the css with urllib.
    elif cssuri:
      logging.info('Processing CSS URI %s' % cssuri)
      if cssuri.find('http://') != 0 and cssuri.find('https://') != 0:
        cssuri = 'http://' + cssuri
      try:
        opener = urllib.FancyURLopener({})
        f = opener.open(cssuri)
        lines = NEWLINE_RE.split(f.read())
        logging.debug('Successfully opened and read %s' % cssuri)
      except IOError, e:
        logging.debug('Failure fetching/processing %s' % cssuri)
        lines = []
        message = "Error while attempting to fetch %s" % (cssuri)
    else:
      logging.debug('Nothing to process, empty post')
      lines = []
      message = "You need to put some text in the css field or uri field."
    
    result = cssjanus.ChangeLeftToRightToLeft(lines,
                                              swap_ltr_rtl_in_url,
                                              swap_left_right_in_url)
    result = "\n".join(result)
    
    template_values = {
      'csstext': csstext,
      'cssuri': cssuri,
      'message': message,
      'result': result,
      'swap_ltr_rtl_in_url': swap_ltr_rtl_in_url,
      'swap_left_right_in_url': swap_left_right_in_url
    }  
    logging.debug('Finished with cssjanus POST processing')
    
    return render_to_response('cssjanus.tpl', template_values)
  

def do(request):
  """Offers a raw cssjanus data processing webservice for uris."""

  cssuri = request.REQUEST['file']
  if cssuri:
    flags = ParseFlags(request)
    swap_ltr_rtl_in_url = flags[0]
    swap_left_right_in_url = flags[1]
    
    logging.info('Processing CSS URI %s' % cssuri)
    if cssuri.find('http://') != 0 and cssuri.find('https://') != 0:
      cssuri = 'http://' + cssuri
    try:
      opener = urllib.FancyURLopener({})
      f = opener.open(cssuri)
      lines = NEWLINE_RE.split(f.read())
    except IOError, e:
      logging.debug('Failure fetching/processing %s' % cssuri)
      lines = []
      message = "Error while attempting to fetch %s" % (cssuri)
      
    result = cssjanus.ChangeLeftToRightToLeft(lines,
                                              swap_ltr_rtl_in_url,
                                              swap_left_right_in_url)
    result = "\n".join(result)
    
  else:
    result = "Pass in the URI of a file to process with ?file=URI"
    
  #self.response.headers['Content-Type'] = 'text/css'
  #self.response.out.write(result)
  return HttpResponse(result)


def ParseFlags(request):
  """Parses flag option values from the request headers."""
  
  # Flags (really params) set up.
  swap_ltr_rtl_in_url = cssjanus.SWAP_LTR_RTL_IN_URL_DEFAULT
  if request.REQUEST.get('swap_ltr_rtl_in_url', None) == 'on':
    swap_ltr_rtl_in_url = True
  logging.info('--swap_ltr_rtl_in_url=%s' % swap_ltr_rtl_in_url)

  swap_left_right_in_url = cssjanus.SWAP_LEFT_RIGHT_IN_URL_DEFAULT
  if request.REQUEST.get('swap_left_right_in_url', None) == 'on':
    swap_left_right_in_url = True
  logging.info('--swap_left_right_in_url=%s' % swap_left_right_in_url)
  
  return [swap_ltr_rtl_in_url, swap_left_right_in_url]
