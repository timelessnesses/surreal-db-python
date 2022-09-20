.PHONY: test clean build publish
stubgen:
	@echo "Generating stubs for $(TARGET)"
	cd surreal
	stubgen -p surreal -o .
	cd ..

beauty:
	@echo "Beautifying $(TARGET)"
	autoflake --in-place --remove-all-unused-imports --remove-unused-variables --recursive surreal/
	black surreal
	isort surreal

build:
	@echo "Building $(TARGET)"
	python setup.py sdist bdist_wheel

test:
	@echo "Testing Surreal Driver"
	cd test
	pytest

publish:
	@echo "Publishing $(TARGET)"
	python setup.py sdist bdist_wheel
	twine upload --verbose dist/* 