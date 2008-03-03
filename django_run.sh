#!/bin/bash
# Author 'elsigh@google.com (Lindsey Simon)'
# This is a convenience script for me to play with cssjanus.
#  ./django_run.sh runserver

# If you're using a path other than the system path for django
export DJANGO_PATH=/home/elsigh/src/django-trunk
export PYTHONPATH=$DJANGO_PATH:/home/elsigh/public_html/cssjanus
export DJANGO_SETTINGS_MODULE=django_settings
$DJANGO_PATH/django/bin/django-admin.py $@
