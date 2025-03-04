#!/bin/bash
set -ex

apt-get update
apt-get install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python3-pip python${PYTHON_VERSION}-venv

ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python
# alias python=python${PYTHON_VERSION}
python -m venv /var/lib/jenkins/lint
chown jenkins:jenkins /var/lib/jenkins/lint

source /var/lib/jenkins/lint/bin/activate
python --version
python3 --version
python -mpip install --upgrade pip
python -mpip install -r /opt/requirements-ci.txt
python -mpip install cmake
