#!/bin/bash
echo "Hello, world!"

if [ "$#" -gt 0 ]; then
    ARG=`echo "$1" | tr '[:upper:]' '[:lower:]'`

    if [ "$ARG" == "true" ]; then
        echo "The argument was true."
    elif [ "$ARG" == "false" ]; then
        echo "The argument was false."
    else
        echo "The argument was not a recognizable boolean value."
    fi
else
    echo "No argument was provided."
fi
