#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IN_DIR="$ROOT_DIR/assets/images/micro"
OUT="$ROOT_DIR/assets/video/micro-explainer.mp4"
FONT="/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"
DUR=3.5

CAP1="Older siblings help a lot."
CAP2="But not all help is the same."
CAP3="Instrumental help = chores, schedules, supervision"
CAP4="Emotional help = mediator, comforter, stable one"
CAP5="The line shows up when it becomes age-inappropriate adult responsibility"
CAP6="What changes outcomes? support, fairness, boundaries"
CAP7="It can be growth, or it can be too much."
CAP8="My website - Helping vs Parentification"

ffmpeg -y \
  -loop 1 -t $DUR -i "$IN_DIR/01_family_entryway.png" \
  -loop 1 -t $DUR -i "$IN_DIR/02_morning_routine.png" \
  -loop 1 -t $DUR -i "$IN_DIR/03_planner.png" \
  -loop 1 -t $DUR -i "$IN_DIR/04_comfort.png" \
  -loop 1 -t $DUR -i "$IN_DIR/05_rush.png" \
  -loop 1 -t $DUR -i "$IN_DIR/06_late_night.png" \
  -loop 1 -t $DUR -i "$IN_DIR/07_calm_chaos.png" \
  -loop 1 -t $DUR -i "$IN_DIR/08_walk.png" \
  -filter_complex "
    [0:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP1':x=60:y=80:fontsize=56:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v0];
    [1:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP2':x=60:y=80:fontsize=56:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v1];
    [2:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP3':x=60:y=80:fontsize=50:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v2];
    [3:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP4':x=60:y=80:fontsize=50:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v3];
    [4:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP5':x=60:y=80:fontsize=44:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v4];
    [5:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP6':x=60:y=80:fontsize=44:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v5];
    [6:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP7':x=60:y=80:fontsize=50:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v6];
    [7:v]scale=1080:1920,format=yuv420p,drawtext=fontfile=$FONT:text='$CAP8':x=60:y=80:fontsize=50:fontcolor=white:box=1:boxcolor=black@0.45:boxborderw=18[v7];
    [v0][v1][v2][v3][v4][v5][v6][v7]concat=n=8:v=1:a=0,format=yuv420p[v]
  " \
  -map "[v]" -r 30 -movflags +faststart "$OUT"

echo "Built: $OUT"
