#!/bin/bash
set -e
echo "clone it"
git clone --depth 1 --branch master --no-checkout https://github.com/yt-dlp/yt-dlp.git /tmp/yt_dlp
git sparse-checkout set yt_dlp/* !yt_dlp/extractor/* --no-cone
git sparse-checkout add yt_dlp/extractor/brightcove.py yt_dlp/extractor/tver.py --no-cone
echo "we removing it"
rm -r ${GITHUB_WORKSPACE}/lib/yt_dlp
echo "we moving it"
mv /tmp/yt_dlp/yt_dlp ${GITHUB_WORKSPACE}/lib/yt_dlp

echo "we commit to it"
git commit -m "[CI] auto update yt-dlp to upstream commit"
echo "yt-dlp succesfully upgraded to upstream commit and staged for push"
