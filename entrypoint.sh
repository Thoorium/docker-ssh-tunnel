#!/usr/bin/env bash

LOCAL_PORT="${LOCAL_PORT:-0}"
REMOTE_PORT="${REMOTE_PORT:-0}"
REMOTE_HOST="${REMOTE_HOST:-0}"
IDENTITY_FILE="${IDENTITY_FILE:-0}"

CMD=(
/usr/bin/autossh
-M 0 -T -N -g -v
-i $IDENTITY_FILE
-oStrictHostKeyChecking=accept-new
-oServerAliveInterval=180
-R $LOCAL_PORT:localhost:$REMOTE_PORT $REMOTE_HOST
)

echo "Executing ${CMD[@]}"

exec "${CMD[@]}"
