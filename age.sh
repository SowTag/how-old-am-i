#!/bin/bash

birth=$(date -d "January 1 1980" +%s)
now=$(date -d "now" +%s)				# Don't modify this

diff=$(($now - $birth))

echo "$diff/60/60/24/365.25" | bc -l | awk '{print $1"0000000000000000"}' | awk '{print substr($0, 0, 10)}'
# The first awk (which contains the zeroes) is to mantain consistency when numbers get rounded (aka 20.1 years -> 20.100000000).
