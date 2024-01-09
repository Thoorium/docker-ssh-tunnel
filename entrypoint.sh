#!/usr/bin/env bash

LOCAL_PORT="${LOCAL_PORT:-0}"
REMOTE_PORT="${REMOTE_PORT:-0}"
REMOTE_HOST="${REMOTE_HOST:-0}"
IDENTITY_FILE="${IDENTITY_FILE:-0}"

CMD=(
ssh
-i $IDENTITY_FILE
-o StrictHostKeyChecking=accept-new
-fNv
-L
$LOCAL_PORT:localhost:$REMOTE_PORT $REMOTE_HOST
)

echo "Executing ${CMD[@]}"

exec "${CMD[@]}"
