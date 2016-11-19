#!/bin/bash

. /usr/local/bin/virtualenvwrapper.sh
workon dbt

cd /usr/src/app

#--nocapture 
if [ $# = 0 ]; then
    echo "Running all tests"
    nosetests --with-coverage --cover-branches --cover-html --cover-html-dir=htmlcov test/unit test/integration/* 
else
    echo "Running specified tests"
    nosetests --with-coverage --cover-branches --cover-html --cover-html-dir=htmlcov $@
fi