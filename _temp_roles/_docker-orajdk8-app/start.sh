#!/bin/bash

JAVA_BIN=/usr/bin
BACKEND_DIR=/opt/backend

cd $BACKEND_DIR

$JAVA_BIN/java -jar ./controlservice.jar > $BACKEND_DIR/controlservice.log 2>&1
