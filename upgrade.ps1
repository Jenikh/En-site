Write-Information "Waiting for new version"
$version_number_old = [System.IO.File]::ReadAllText("version-number.txt")
Invoke-WebRequest -Uri "https://jenikh.github.io/En-site/version-number.txt" -OutFile "version-number.txt"
$version_number_new = [System.IO.File]::ReadAllText("version-number.txt")
if ($version_number_old == $version_number_new) {
    exit(1)
}
$base_url = "https://jenikh.github.io/En-site/files/en-site.zip"
Write-Information "Downloading from $base_url"
Invoke-WebRequest -Uri $base_url -OutFile "en-site.zip"

Expand-Archive -Path "en-site.zip" -DestinationPath ".\" -Force
Remove-Item "en-site.zip"


Write-Host "Upgrade from $version_number_old to $version_number_new copleted!" -BackgroundColor White -ForegroundColor DarkYellow
exit(0)