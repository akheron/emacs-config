#!/usr/bin/env python
#
# Reads issue data from http://bugs.python.org/ and creates a Capture
# template for it

import xmlrpclib
import sys

template_file = sys.argv[1]
issue_id = int(sys.argv[2])

roundup = xmlrpclib.ServerProxy('http://bugs.python.org/', allow_none=True)
issue = roundup.display('issue%d' % issue_id)
issue['id'] = issue_id

if template_file == '-':
    fobj = sys.stdout
else:
    fobj = open(template_file, 'w')

with fobj:
    fobj.write('''\
* #%(id)s: %(title)s
  http://bugs.python.org/issue%(id)d

  %%?''' % issue)
