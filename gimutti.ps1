# TODO: 義務ッチ用スクリプト

# thx: https://gist.github.com/coldnebo/1148334
Add-Type @"
  using System;
  using System.Runtime.InteropServices;
  public class Win32 {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool GetClientRect(IntPtr hWnd, out RECT lpRect);
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
  }
  public struct RECT
  {
    public int Left;        // x position of upper-left corner
    public int Top;         // y position of upper-left corner
    public int Right;       // x position of lower-right corner
    public int Bottom;      // y position of lower-right corner
  }
"@

$browser = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Vivaldi\Application\vivaldi.exe"
$sns_url = "https://mstdn.mimikun.jp/deck/getting-started"
$twitch_url = "https://twitch.com/mimikun_8"
$fav_urls = @(
    "https://paimon.moe",
    "https://act.hoyolab.com/ys/app/interactive-map/index.html?lang=ja-jp#/map/2?shown_types=45&center=2008.50,-1084.00&zoom=-3.00"
)
$streaming_soft = Join-Path -Path $env:ProgramFiles -ChildPath "obs-studio\bin\64bit\obs64.exe"
$obsidian_app = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Obsidian\Obsidian.exe"

#--- main ---#
$rcWindows = New-Object RECT
$rcClient = New-Object RECT

function Open-Url {
    Param($url)
    Start-Process -FilePath $browser -ArgumentList "--new-window $url"
}

# Open Twitch window
Open-Url $twitch_url

# Open mastodon window
#Open-Url $sns_url

#Start-Process -FilePath $browser -ArgumentList "--new-window $twitch_url"
# Open favorite urls
#Start-Process -FilePath $browser -ArgumentList "--new-window $fav_urls"
# Open OBS Studio
# TODO: Fix error code

#Start-Process -FilePath $streaming_soft

# Open Obsidian app
# NOTE: 変なログが出てくる
#Start-Process -FilePath $obsidian_app
