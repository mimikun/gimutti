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
$streaming_soft_dir = Join-Path -Path $env:ProgramFiles -ChildPath "obs-studio\bin\64bit"
$streaming_soft = Join-Path -Path $env:ProgramFiles -ChildPath "obs-studio\bin\64bit\obs64.exe"
$obsidian_app = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Obsidian\Obsidian.exe"
$current_dir = pwd

#--- main ---#
$rcWindows = New-Object RECT
$rcClient = New-Object RECT

function Open-Url {
    Param($url)
    Start-Process -FilePath $browser -ArgumentList "--new-window $url"
}

<#
#>
# Twitch window
Open-Url $twitch_url
$twitch_window = Get-Process |
    where {$_.ProcessName -eq "vivaldi"} |
    where {$_.MainWindowTitle.Contains("mimikun_8")}
# TODO: サブディスプレイ左上に配置する

Write-Output "WIP"

# Mastodon window
Open-Url $sns_url
$sns_window = Get-Process |
    where {$_.ProcessName -eq "vivaldi"} |
    where {$_.MainWindowTitle.Contains("mimikun")}
# TODO: メインディスプレイ左上に配置する

Write-Output "WIP"

# Open favorite urls
Open-Url $fav_urls
$fav_window = Get-Process |
    where {$_.ProcessName -eq "vivaldi"} |
    where {$_.MainWindowTitle.Contains("Paimon.moe")}
# TODO: サブディスプレイ右上に配置する

Write-Output "WIP"

# Open OBS Studio
# NOTE: ターミナルからOBSは起動できない
# ref: https://github.com/obsproject/obs-studio/issues/2966

cd $streaming_soft_dir
Start-Process "obs64.exe"
cd $current_dir
$obs_window = Get-Process |
    where {$_.ProcessName -eq "obs64"}
    where {$_.MainWindowTitle.Contains("OBS")}

# TODO: サブディスプレイ左下に配置する

Write-Output "WIP"


# Open Obsidian app
# NOTE: PowerShellには/dev/null がないため
# 通常のファイルにリダイレクトする形になる
# dev_nullは別途手で削除すること
Start-Process -FilePath $obsidian_app -RedirectStandardOutput dev_null
$obsidian_window = Get-Process |
    where {$_.ProcessName -eq "obsidian"} |
    where {$_.MainWindowTitle}
# TODO: サブディスプレイ右上に配置する

Write-Output "WIP"
