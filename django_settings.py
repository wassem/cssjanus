# Copyright 2008 Google Inc. All Rights Reserved.

# Django settings for CSS Janus.

__author__ = 'elsigh@google.com (Lindsey Simon)'

# YOU NEED TO SET THIS VARIABLE TO POINT TO YOUR INSTALL PATH
TEMPLATE_DIRS = (
    '/home/elsigh/public_html/cssjanus'
)

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
  ('Lindsey Simon', 'elsigh@google.com'),
)
MANAGERS = ADMINS

# Local time zone for this installation. Choices can be found here:
# http://www.postgresql.org/docs/8.1/static/datetime-keywords.html#DATETIME-TIMEZONE-SET-TABLE
# although not all variations may be possible on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = ''

# Language code for this installation. All choices can be found here:
# http://www.w3.org/TR/REC-html40/struct/dirlang.html#langcodes
# http://blogs.law.harvard.edu/tech/stories/storyReader$15
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = False

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'jvs30_ok!o!gf)dfao)#r+jz$%^s%-mxwxy*$2fgj46-j@=i*c'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
    'django.template.loaders.eggs.load_template_source',
)

ROOT_URLCONF = 'django_urls'
INSTALLED_APPS = (
    'cssjanus'
)
