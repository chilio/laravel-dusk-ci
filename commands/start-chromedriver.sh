#!/bin/bash

chromedriver --port=9515 &

while ! nc -z localhost 9515; do
  sleep 0.1 # wait for 1/10 of the second before check again
done

echo "Chromedriver started succesfully on port 9515"

