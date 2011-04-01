#!/bin/sh

. ~/local/virtualenvs/python2.6/bin/activate

pyflakes "$1"
pep8 --repeat "$1"

true
