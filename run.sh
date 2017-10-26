#!/usr/bin/env bash
docker stop try-http4s:0.1
docker rm try-http4s:0.1
docker run -it -p8080:8080 try-http4s:0.1