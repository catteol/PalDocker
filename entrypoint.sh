#!/bin/bash
steamcmd +force_install_dir /home/docker/PalServer +login anonymous +app_update 2394010 validate +quit

args=()

if [ "$MULTITHREAD" = true ]; then
    args+=("-useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS")
fi
if [ -n "$PLAYERS" ]; then
    args+=("players="${PLAYERS})
fi
if [ "$PUBLIC_SERVER" = true ]; then
    args+=("EpicApp=PalServer")
fi
if [ -n "$PUBLIC_IP" ]; then
    args+=("-publicip="${PUBLIC_IP})
fi
if [ -n "$PUBLIC_PORT" ]; then
    args+=("-publicport="${PUBLIC_PORT})
fi

echo "Start command args:" ${args[@]}

./PalServer/PalServer.sh ${args[@]}