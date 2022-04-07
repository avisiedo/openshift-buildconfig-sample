#!/bin/bash

function _sigterm {
	echo "Exiting by SIGTERM"
	exit 1
}

trap _sigterm SIGTERM

while true; do echo "Hello World"; sleep 2; done

