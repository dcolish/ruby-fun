# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

LIBDIR      = Config::CONFIG['libdir']
INCLUDEDIR  = Config::CONFIG['includedir']

HEADER_DIRS = ['/usr/include/python2.6/', INCLUDEDIR, '/usr/include']
LIB_DIRS = ['/usr/lib/python2.6/', LIBDIR, '/usr/lib']

extension_name = 'pymodule'

dir_config(extension_name, HEADER_DIRS, LIB_DIRS)

unless find_header('Python.h')
  abort "Python.h is missing"
end

unless find_library('python', 'Py_Initialize')
  abort "Can't link against Python.h"
end

create_makefile(extension_name)

