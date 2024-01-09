#!/usr/bin/env bash

LOCAL_PORT="${LOCAL_PORT:-0}"
REMOTE_PORT="${REMOTE_PORT:-0}"
REMOTE_HOST="${REMOTE_HOST:-0}"
IDENTITY_FILE="${IDENTITY_FILE:-0}"

cp $IDENTITY_FILE /auth-key
chmod 600 /auth-key

CMD=(
/usr/bin/autossh
-M 0 -T -N -g -v
-i /auth-key
-oStrictHostKeyChecking=accept-new
-oServerAliveInterval=180
-R $LOCAL_PORT:localhost:$REMOTE_PORT $REMOTE_HOST
)

echo "Executing ${CMD[@]}"

exec "${CMD[@]}"