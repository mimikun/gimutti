# TODO: 義務ッチ用スクリプト

# Set your browser fullpath
$browser = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Vivaldi\Application\vivaldi.exe"
# Set your main SNS URL
$sns_url = "https://mstdn.mimikun.jp/deck/getting-started"
# Set your Twitch URL"
$twitch_url = "https://twitch.com/mimikun_8"
# Set your favorite pages
# e.g. paimon.moe, Teyvat map
$fav_urls = @(
    "https://paimon.moe",
    "https://act.hoyolab.com/ys/app/interactive-map/index.html?lang=ja-jp#/map/2?shown_types=45&center=2008.50,-1084.00&zoom=-3.00"
)
# Set your Streaming software fullpath
$streaming_soft = Join-Path -Path $env:ProgramFiles -ChildPath "obs-studio\bin\64bit\obs64.exe"
# Obsidian.exe fullpath
$obsidian_app = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Obsidian\Obsidian.exe"

#--- main ---#

# Open mastodon window
Start-Process -FilePath $browser -ArgumentList "--new-window $sns_url"
# Open Twitch window
Start-Process -FilePath $browser -ArgumentList "--new-window $twitch_url"
# Open favorite urls
Start-Process -FilePath $browser -ArgumentList "--new-window $fav_urls"
# Open OBS Studio
Start-Process -FilePath $streaming_soft
# Open Obsidian app
Start-Process -FilePath $obsidian_app
