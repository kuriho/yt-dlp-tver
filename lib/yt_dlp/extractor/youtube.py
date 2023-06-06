from .common import InfoExtractor

class YoutubeIE(InfoExtractor):
    @classmethod
    def suitable(cls, url):
        return False
