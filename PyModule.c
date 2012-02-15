#include "Python.h"
#include "ruby.h"

VALUE PyModule = Qnil;

void Init_pymodule();

VALUE method_Py_Initialize();

VALUE method_PyRun_SimpleString();

void Init_pymodule() {
    PyModule = rb_define_module("PyModule");
    rb_define_method(PyModule, "Py_Initialize", method_Py_Initialize, 0);
    rb_define_method(PyModule, "PyRun_SimpleString", method_PyRun_SimpleString, 1);
}

VALUE method_Py_Initialize(VALUE self) {
    Py_Initialize();
    return Qnil;
}

VALUE method_PyRun_SimpleString(VALUE self, VALUE command) {
    return INT2NUM(PyRun_SimpleString(RSTRING(command)->as.ary));
}

    
    
    
