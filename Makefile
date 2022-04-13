.PHONY: test sdist bdist_wheel_linux bdist_windows

MIN_COVERAGE_PERCENTAGE=99

VENV_PATH=${PWD}/.py-env

clean:
	python setup.py clean

build:
	echo "TODO: build"

test:
	coverage erase
	coverage run -m unittest discover src/log_indented/ '*_test.py' --locals -v
	coverage report -m --fail-under $(MIN_COVERAGE_PERCENTAGE)

shell:
	@echo "To enter python environment, type:"
	@echo "    source $(VENV_PATH)/bin/activate"
	@echo "(this assumes you have already created your environment with 'make env')."

format:
	black src/log_indented --line-length 140 

lint:
	black --check src/log_indented --line-length 140
	mypy src/log_indented
	flake8 src/log_indented --count --select=E9,F63,F7,F82 --show-source --statistics
	flake8 src/log_indented --count --max-complexity=10 --max-line-length=140 --statistics
	pylint -j 0 src/log_indented

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


sdist:
	python3 -m build
	# python setup.py sdist
