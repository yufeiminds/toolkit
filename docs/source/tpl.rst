.. _tpl:

Jinja2 Tools
============

The :mod:`tpl` module has some helper function implements base on :mod:`jinja2` for human.


Environment
-----------

*Register* is a fast function for injecting function to jinja2 environment that create by :mod:`tpl`,

.. note:: ``register`` must be call before the jinja2 environment has been created.

Environment can be created by:

* create_env_by_folder

.. tip:: the :func:`create_env_by_folder` based on :class:`jinja2.environment` with :meth:`jinja2.FileSystemLoader`

Generally speaking, there are three ways to call a register

* immutable function
* decorator
* decorator with name

**Toolkit** implemented 2 register for jinja2 environment:

**register_filter**

.. code-block:: python

    register_filter('lower', str.lower)

    @register_filter
    def lower(s):
        return s.lower()

    @register_filter('lower')
    def xxx_lower():
        return s.lower()

and you can use it on :mod:`jinja2` template:

.. code-block:: html

    {{HERE is a Demo | lower }}

    >>> here is a demo

**register_test**

the :func:`register_test` can register the test function, use it on template:

.. code-block:: python

    register_test('digital', lambda v: type(v) in (int, float))

    @register_test
    def digital(v):
        return type(v) in (int, float)

    @register_test('digital')
    def test_if_it_is_digital():
        return type(v) in (int, float)

.. code-block:: html

    {{ 9 is digital }}

Template
--------

See the template as an object, :func:`get_template` get template object from absolute path.

For example, the template has:

.. code-block:: html

    {% macro add(a, b) -%}
        {{a + b}}
    {%- endmacro %}

And call the macro as template object method.

.. code-block:: python

    tpl = get_template('template.tpl')
    print(tpl.add(1, 2))

    >>> 3

We also can render jinja2 template file with absolute path.

A simple template as follow:

.. code-block:: jinja

    This is a test template

    {{ title }}

Then write render code by single line.

.. code-block:: python

    render('template.tpl', name='toolkit')