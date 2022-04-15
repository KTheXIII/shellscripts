#!/usr/bin/env sh

target_dir=$1

if [ -z "${target_dir}"]
then
    target_dir="."
fi


for file in *.mov
do
    output_name="${target_dir}/${file%.*}"
    ffmpeg -i "${file}" -qscale 0 -vcodec copy -crf 20 "${output_name}.mp4"
done

