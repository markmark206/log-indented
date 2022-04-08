.PHONY: test sdist bdist_wheel_linux bdist_windows

VENV_PATH=${PWD}/.py-env

clean:
	python setup.py clean

build:
	echo "TODO: build"

test:
	python -m unittest discover src '*_test.py' --locals -v

format:
	black src --line-length 140 


lint:
	pylint -j 0 src

env:
	@python3.9 -m venv $(VENV_PATH) --prompt "🟢"
	@source $(VENV_PATH)/bin/activate && \
		pip install -r requirements.txt
	@echo
	@echo "To activate your Python environment, run:"
	@echo "    source $(VENV_PATH)/bin/activate"

install-dependencies:
	source $(VENV_PATH)/bin/activate && \
	    pip-compile --output-file requirements.txt requirements.in && \
	    pip install -r requirements.txt



