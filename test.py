import requests

URL_BEST = f"https://service-api.tver.jp/api/v1/callEpisodeRankingDetail/variety"
URL_VIDEO_WEBSITE = 'https://tver.jp/{}s/{}'

def extract_info(url):
    from lib.yt_dlp import YoutubeDL
    from lib.yt_dlp.extractor.tver import TVerIE

    ydl_opts = {
        'format': 'bestvideo*+bestaudio/best'
    }

    ydl = YoutubeDL(ydl_opts)
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
    assert info['manifest_url']
