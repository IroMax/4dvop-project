#!/bin/bash
keyword="student_ages" # enter the keyword for test content
if curl -u toto:python -X GET http://192.168.48.10:5001/pozos/api/v1.0/get_student_ages | grep "$keyword"
then
    # if the keyword is in the content
    exit 0
else
    exit 1
fi