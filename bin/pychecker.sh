#!/bin/sh

. ~/local/virtualenvs/python2.6/bin/activate

pyflakes "$1"
pep8 --ignore=E501 --repeat "$1"

true
