#!/bin/bash
ffmpeg -i "$1" -c:a copy -c:v copy -crf 50 "$2.mp4"
