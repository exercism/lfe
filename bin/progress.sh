#!/usr/bin/env bash

LFE=$(find . -name 'example.lfe' | wc -l | awk '{printf $1}')
ERL=$(find . -name 'example.erl' | wc -l | awk '{printf $1}')
TOT=$(($LFE + $ERL))

printf "%2s  ported to LFE\n" $LFE
printf "%2s  unported from Erlang\n" $ERL
printf "%2s  total exercises\n" $TOT
printf '%0.f%% finished\n' $(bc <<< "scale = 2; $LFE / $TOT * 100")
