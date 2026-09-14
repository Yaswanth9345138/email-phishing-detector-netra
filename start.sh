#!/bin/bash

set -e

echo "Starting NETRA FastAPI backend..."

python -m uvicorn backend.main:app \
    --host 127.0.0.1 \
    --port 8001 &

echo "Starting NETRA Streamlit dashboard..."

exec python -m streamlit run dashboard/app.py \
    --server.address 0.0.0.0 \
    --server.port "$PORT"
