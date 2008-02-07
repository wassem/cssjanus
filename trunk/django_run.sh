#!/bin/bash

# Provided you've installed the django libraries on your machine, you should
# be able to run the local devel server simply by editing this file to
# point to the absolute path of your checkout and then running:
#  ./django_run.sh runserver

export PYTHONPATH=/home/elsigh/public_html/cssjanus
export DJANGO_SETTINGS_MODULE=django_settings
django-admin $@
