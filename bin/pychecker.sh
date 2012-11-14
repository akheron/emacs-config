#!/bin/sh
#
# Usage: pychecker.sh PATH-TO-VIRTUALENV FILE-TO-CHECK

. $1/bin/activate

pyflakes "$2"
pep8 --ignore=E124,E501 --repeat "$2"

true
