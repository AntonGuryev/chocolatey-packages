$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://download.microsoft.com/download/a/9/a/a9aa45ec-02cb-4647-b78c-ae780c6bab63/en-US/19.2.0.0/x86/msoledbsql.msi'
$url64      = 'https://download.microsoft.com/download/a/9/a/a9aa45ec-02cb-4647-b78c-ae780c6bab63/en-US/19.2.0.0/x64/msoledbsql.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Microsoft OLE DB Driver 19 for SQL Server'

  checksum      = 'FDBF01749834C9CB4BF1C62AD418B96CE2F26148F6D6FA97BE2520C613E0B35F'
  checksumType  = 'sha256'
  checksum64    = '9E48A797C356F2BD4AE5EC1A61B32342E04726A3F45F94FDF643203A3227D3C8'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" IACCEPTMSOLEDBSQLLICENSETERMS=YES"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs