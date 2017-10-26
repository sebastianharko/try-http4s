#!/bin/bash
sbt clean
sbt universal:packageBin
docker build -t try-http4s:0.1 .