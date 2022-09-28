*** Settings ***
Library    mylib.py


*** Test Cases ***
This Test Uses A Custom Python Keyword
    Check String Length    Hello Robots    12

This Test Will Fail
    Check String Length    Hello Humans    11