#!/bin/bash
set -e

git clone --depth 1 --branch master --sparse --no-checkout https://github.com/yt-dlp/yt-dlp.git 
# /tmp/yt_dlp/
cd yt_dlp
git sparse-checkout set yt_dlp/* !yt_dlp/extractor/* --no-cone
git sparse-checkout add yt_dlp/extractor/brightcove.py yt_dlp/extractor/tver.py --no-cone

#echo "we moving it"
#ls /tmp/yt_dlp/
#mv -f /tmp/yt_dlp/yt_dlp ${GITHUB_WORKSPACE}/lib/yt_dlp

echo "we commit to it"
git commit -m "auto update yt-dlp"
echo "yt-dlp succesfully upgraded and staged for push"
