#!/bin/bash
service nginx start
gcc mini_server.c -lfcgi -o mini_server
./mini_server
