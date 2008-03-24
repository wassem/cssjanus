# Copyright 2008 Google Inc. All Rights Reserved.

# Django settings for CSSJanus.

__author__ = 'elsigh@google.com (Lindsey Simon)'

# YOU NEED TO SET THIS VARIABLE TO POINT TO YOUR INSTALL PATH
CSSJANUS_DIR = '/home/elsigh/public_html/cssjanus'

DEBUG = True
TEMPLATE_DEBUG = DEBUG

LANGUAGE_CODE = 'en'
TIME_ZONE = 'US/Pacific'
DATABASE_ENGINE = 'sqlite3' 
DATABASE_NAME = CSSJANUS_DIR + '/cssjanus.db'
USE_I18N = True
MIDDLEWARE_CLASSES = (
  'django.middleware.common.CommonMiddleware',
  'django.contrib.sessions.middleware.SessionMiddleware',
  'django.middleware.locale.LocaleMiddleware',
)
gettext = lambda s: s
LANGUAGES = (
  ('ar', gettext('Arabic')),
  ('en', gettext('English')),
  ('fr', gettext('French')),
  ('fa', gettext('Persian')),
)

TEMPLATE_DIRS = (
  CSSJANUS_DIR
)
ADMINS = (
  ('Lindsey Simon', __author__),
)
MANAGERS = ADMINS
USE_ETAGS=True
SECRET_KEY = 'jvs30_ok!o!gf)dfao)#r+jz$%^s%-mxwxy*$2fgj46-j@=i*c'
ROOT_URLCONF = 'django_urls'
INSTALLED_APPS = (
  'django.contrib.auth',
  'django.contrib.contenttypes',
  'django.contrib.sessions',
  'cssjanus'
)
