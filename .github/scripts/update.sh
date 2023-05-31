#!/bin/bash
set -e

echo "GITHUB_WORKSPACE: $Env:GITHUB_WORKSPACE"
echo "GITHUB_SHA: $Env:GITHUB_SHA"
echo "GITHUB_REF: $Env:GITHUB_REF"
echo "GITHUB_ACTOR: $Env:GITHUB_ACTOR"
echo "GITHUB_REPOSITORY: $Env:GITHUB_REPOSITORY"
git --version

$authToken="x-access-token:${{ secrets.GITHUB_TOKEN }}"
$bytes=[System.Text.Encoding]::UTF8.GetBytes($authToken)
$encodedAuthToken=[Convert]::ToBase64String($bytes)
          
git config --local http.https://github.com/.extraheader "AUTHORIZATION: basic ${encodedAuthToken}"

git clone --depth 1 --branch master --no-checkout https://github.com/yt-dlp/yt-dlp.git /tmp/yt_dlp/
cd /tmp/yt_dlp/
git sparse-checkout set yt_dlp/* !yt_dlp/extractor/* --no-cone
git sparse-checkout add yt_dlp/extractor/brightcove.py yt_dlp/extractor/tver.py --no-cone

echo "we moving it"
ls /tmp/yt_dlp/
mv -f /tmp/yt_dlp/yt_dlp ${GITHUB_WORKSPACE}/lib/yt_dlp

echo "we commit to it"
git commit -m "auto update yt-dlp"
echo "yt-dlp succesfully upgraded and staged for push"
