# yt-dlp-tver 
Just enough [yt-dlp](https://github.com/yt-dlp/yt-dlp) for TVer.jp

![unit test badge](https://github.com/kuriho/script.module.yt-dlp-tver/actions/workflows/test.yml/badge.svg)
[![THANKS.md](https://img.shields.io/badge/THANKS-md-ff69b4.svg)](THANKS.md)

<img src="https://github.com/kuriho/script.module.yt-dlp-tver/blob/master/icon.png?raw=true" alt="drawing" width="200"/>




## Why?
Stripping off all extractors that are not relevant to TVer.jp not only shaves off **~82%** of the size of the library but, more importantly, reduces the amount of relevant changes tremendously. 

Should this turn out to be a bad idea after all, I can at least say that I learned a lot about GitHub Actions in the process ;)

## Modifications
Other than removing most of the irrelevant extractors there had to be made some minor changes to [_extractors.py](lib/yt_dlp/extractor/_extractors.py) and (sadly) [generic.py](https://gist.github.com/kuriho/6030dbda5bb07dc8f307d78d2770457e/revisions?diff=unified). 

## CI pipeline
<img src="https://github.com/kuriho/script.module.yt-dlp-tver/blob/master/media/ci.png?raw=true" alt="drawing" width="600"/>

### changes get pushed to yt-dlp

### update yt_dlp for TVer [update.yml](.github/workflows/update.yml)

### optimistically test TVer extraction [test.yml](.github/workflows/test.yml)

### distribute library [distribute.yml](.github/workflows/distribute.yml)
