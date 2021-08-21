#!/bin/sh

echo "Processing templates '$INPUT_TEMPLATES'..."

for file in $(echo $INPUT_TEMPLATES | sed "s/,/ /g")
do
    echo "  $file:"
    envsubst -i $file -o $file -no-unset -no-empty -fail-fast
done
