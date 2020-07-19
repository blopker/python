#!/usr/bin/env sh
set -eux

pip install pyperformance
python3 -m pyperf system tune || true
pyperformance run -b django_template -o /app/${TEST_ID}.json