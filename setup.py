# from setuptools import find_packages, setup
from distutils.core import setup

setup(
    name='log-indented',
    # packages=find_packages(),
    version='0.1.0',
    description='A logging utility that makes your logs easy to grok (stack-depth-indented!) and use (deocrator!)',
    author='Merk Markaryan',
    author_email='markmark205+log_indented@gmail.com',
    url='https://github.com/markmark206/log-indented',
    # py_modules=['log-indented'],
    packages=["log_indented"],
    # package_dir={'': 'src'},
    license='MIT',
)
