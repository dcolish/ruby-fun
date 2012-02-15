require "pymodule"
include PyModule

Py_Initialize()
PyRun_SimpleString("print 'hellooo'")
