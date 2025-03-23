from .common import InfoExtractor

# Placeholder: Waiting for yt-dlp/yt-dlp#12679 to be merged
class StreaksIE(InfoExtractor):
    @classmethod
    def suitable(cls, url):
        return False