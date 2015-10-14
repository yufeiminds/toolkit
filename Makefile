#
# Copyright 2015 Yufei Li
#
# ---
#
# - mail: yufeiminds@gmail.com
# - date: 2015-09-05
# - description: A toolkit for bind tool-script、tool-class and tool-function
#

help:
	@echo "develop		build develop enviroments."
	@echo "test 		run tests."
	@echo "document 	build the documents."

develop:
	python setup.py -q develop
	pip install -r dev_requirements.txt

test:
	py.test -s -v tests/

document:
	@make -C docs clean
	@make -C docs html
	@echo "Documents has built finished."
	@if [ -d $(which open) ]; then open docs/build/html/index.html; fi

pypi:
	python setup.py sdist bdist_wheel upload

clean:
	@rm -rf dist build
	@rm -rf tests/__pycache__
