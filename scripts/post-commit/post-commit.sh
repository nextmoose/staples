#!/bin/sh

while ! git push personal $(git rev-parse --abbrev-ref HEAD --)
do
    sleep 1s &&
	true
done &&
    true
