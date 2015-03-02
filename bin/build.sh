#!/bin/bash

GSD5_DIR=`pwd`
TIDDLYWIKI5_DIR=$GSD5_DIR/../TiddlyWiki5

OUTPUT_DIR=$GSD5_DIR/output

for edition in gsd5-demo gsd5-empty; do

  OUTPUT_FILE=$edition.html
  mkdir -p $OUTPUT_DIR

  export TIDDLYWIKI_PLUGIN_PATH=$GSD5_DIR/plugins

  ( cd $TIDDLYWIKI5_DIR && node ./tiddlywiki.js \
    $GSD5_DIR/editions/$edition \
    --verbose \
    --output $GSD5_DIR/output \
    --rendertiddler $:/core/save/all $OUTPUT_FILE text/plain )

  echo Wrote $OUTPUT_DIR/$OUTPUT_FILE maybe

done
