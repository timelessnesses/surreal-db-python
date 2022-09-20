.PHONY: test clean build build_c_lib
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
	python setup.py build

test:
	@echo "Testing Surreal Driver"
	cd test
	pytest

build_c_lib:
	@echo "Building surreal_compiled for faster speed (barely noticable)"
	cythonize surreal/surreal_compiled.py -3
	cythonize surreal/surreal_compiled.py --build --inplace