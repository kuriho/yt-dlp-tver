#!/bin/bash
set -e

ls -alrth 
git clone --depth 1 --branch master --no-checkout https://github.com/yt-dlp/yt-dlp.git tmp/yt_dlp/
ls -alrth 
cd tmp/yt_dlp/
git sparse-checkout set yt_dlp/* !yt_dlp/extractor/* --no-cone
git sparse-checkout add yt_dlp/extractor/brightcove.py yt_dlp/extractor/tver.py --no-cone
ls -alrth

cd ..
cd ..
ls -alrth

mv -f tmp/yt_dlp/yt_dlp lib/yt_dlp/

git add lib/yt_dlp/

echo "we commit to it"
git commit -m "auto update yt-dlp"
echo "yt-dlp succesfully upgraded and staged for push"
