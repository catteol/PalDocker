#!/bin/bash
steamcmd +force_install_dir /home/docker/PalServer +login anonymous +app_update 2394010 validate +quit

args=()

if [ "$MULTITHREAD" = true ]; then
    args+=("-useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS")
fi
if [ -n "$PLAYERS" ]; then
    args+=("players="${PLAYERS})
fi

echo "Start command args:" ${args[@]}

./PalServer/PalServer.sh ${args[@]}