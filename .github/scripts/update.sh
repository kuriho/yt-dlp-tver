#!/bin/bash
set -e
git clone --depth 1 --branch master --no-checkout https://github.com/yt-dlp/yt-dlp.git /tmp/yt_dlp
cd /tmp/yt_dlp
git sparse-checkout set yt_dlp/* !yt_dlp/extractor/*
git sparse-checkout add yt_dlp/extractor/brightcove.py yt_dlp/extractor/tver.py
cd ..
cd ..
rm -r ${GITHUB_WORKSPACE}/lib/yt_dlp
mv /tmp/yt_dlp/yt_dlp ${GITHUB_WORKSPACE}/lib/yt_dlp

git commit -m "[CI] auto update yt-dlp to upstream commit"
echo "yt-dlp succesfully upgraded to upstream commit and staged for push"
