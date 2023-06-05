# yt-dlp-tver 
Just enough [yt-dlp](https://github.com/yt-dlp/yt-dlp) for TVer.jp

![unit test badge](https://github.com/kuriho/script.module.yt-dlp-tver/actions/workflows/test.yml/badge.svg)
[![THANKS.md](https://img.shields.io/badge/THANKS-md-ff69b4.svg)](THANKS.md)

<img src="https://github.com/kuriho/script.module.yt-dlp-tver/blob/master/icon.png?raw=true" alt="drawing" width="200"/>




## Why?
_By removing all extractors that are irrelevant to TVer.jp, yt-dlp-tver not only achieved a reduction of approximately **82%** in the size of the library but, more importantly, significantly minimized the frequency of necessary changes downstream._

If this approach ultimately proves to be a poor decision, I can still take solace in the fact that I gained valuable knowledge about GitHub Actions along the way.

## Modifications
Besides removing all extractors that aren't necessary for extracting a valid stream manifest URL from TVer.jp, there had to be made some minor changes to [_extractors.py](lib/yt_dlp/extractor/_extractors.py) and (sadly) [generic.py](https://gist.github.com/kuriho/6030dbda5bb07dc8f307d78d2770457e/revisions?diff=unified). 

## CI pipeline
<img src="https://github.com/kuriho/script.module.yt-dlp-tver/blob/master/media/ci.png?raw=true" alt="drawing" width="600"/>

### changes get pushed to yt-dlp
yt-dlp is an enourmous project supporting an ever growing [list of streaming websites](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md). As a direct result of this there is hardly ever a day without [multiple changes](https://github.com/yt-dlp/yt-dlp/commits/master) being pushed to master.

### update yt_dlp for TVer [update.yml](.github/workflows/update.yml)
An hourly cron job triggers this Github Action, which utilizes git [Sparse Checkout](https://git-scm.com/docs/git-sparse-checkout) to selectively checkout and push only the needed parts of yt-dlp to yt-dlp-tver.

### test TVer extraction [test.yml](.github/workflows/test.yml)
This Github Action is triggered on every push to the /lib/yt-dlp/ path of this repository. It executes a [pytest](https://pytest.org/) [unit test](test.py) that (optimistically) checks the TVer.jp extractor. 

### distribute library [distribute.yml](.github/workflows/distribute.yml)
Triggered by a successful unit test of the TVer.jp extractor, this Github Action distributes the latest version of yt-dlp-tver [downstream](https://github.com/kuriho/plugin.video.tver).
