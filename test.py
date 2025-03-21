import requests
import os

URL_BEST = f"https://service-api.tver.jp/api/v1/callEpisodeRankingDetail/variety"
URL_VIDEO_WEBSITE = 'https://tver.jp/{}s/{}'

def extract_first_manifest_url_from_info(result):
    if 'manifest_url' in result:
        return result['manifest_url']

    if 'requested_formats' not in result:
        return None
    
    for entry in result['requested_formats']:
        if 'manifest_url' in entry and 'vcodec' in entry:
            return entry['manifest_url']
    return None

def extract_info(url):
    from lib.yt_dlp import YoutubeDL
    from lib.yt_dlp.extractor.tver import TVerIE

    proxy = os.environ.get('GEO_VERIFICATION_PROXY')

    ydl_opts = {
        'geo_verification_proxy': proxy
    }

    with YoutubeDL(ydl_opts) as ydl:
        ydl.add_info_extractor(TVerIE()) 
        info = ydl.extract_info(url, download=False)
    return info

def get_valid_episode():
    resp = requests.get(URL_BEST, headers={'x-tver-platform-type': 'web'}, timeout=10)
    data = resp.json()
    for episode in data['result']['contents']['contents']:
        if episode['type'] == 'episode':
            return URL_VIDEO_WEBSITE.format('episode', episode['content']['id'])

def test_tver():
    url = get_valid_episode()
    print(url)
    assert url

    info = extract_info(url)
    manifest_url = extract_first_manifest_url_from_info(info)
    assert manifest_url