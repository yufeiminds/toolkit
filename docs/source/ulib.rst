.. _ulib:

Unicode Tools
=============

:mod:`ulib` is a library for processing the unicode character or string more pythonic.

.. warning:: This module not finished, don't use it on product environment.

Common
------

.. code-block:: python

    from toolkit import ulib

    ulib.is_digital(u'9')
    >>> True

    ulib.is_digital(u'q')
    >>> False


Chinese
-------

if the param is not unicode, :func:`is_cn` will raise a :exc:`NotUnicodeException`.

.. code-block:: python

    from toolkit import ulib

    ulib.is_cn(u'中')
    >>> True

    ulib.is_cn(u'c')
    >>> False

    try:
        ulib.is_cn('中')
    except NotUnicodeException as e:
        pass

the :func:`has_cn` test if there is chinese unicode character in the unicode string.

.. code-block:: python

    ulib.has_cn(u'Here is a 中文 character.')
    >>> True

    ulib.has_cn(u'Here is not any chinese character.')
    >>> False

:func:`cnlen` also can caculate unicode string that contained chinese character length simply,

.. code-block:: python

    ulib.cnlen('Here is 中文')
    >>> 12

.. note:: :func:`cnlen` caculate one full-width character as two halt-width characters.