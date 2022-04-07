#!/bin/bash

MSG="Hello World 5"

function _sighandler {
	echo "Exiting by $1"
	exit 0
}

trap "_sighandler SIGTERM" SIGTERM
trap "_sighandler SIGINT" SIGINT

while true; do echo "$MSG"; sleep 2; done

