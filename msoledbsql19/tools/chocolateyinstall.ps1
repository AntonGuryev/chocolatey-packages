$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://download.microsoft.com/download/9/a/9/9a92e8f7-e6cc-467a-a909-e78eb671235d/en-US/19.0.0.0/x86/msoledbsql.msi'
$url64      = 'https://download.microsoft.com/download/9/a/9/9a92e8f7-e6cc-467a-a909-e78eb671235d/en-US/19.0.0.0/x64/msoledbsql.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Microsoft OLE DB Driver 19 for SQL Server'

  checksum      = '1F6AC4DF1F1711691CCAB53F10DD9977D772C33B537DF5D6DBD5A426C67BA9A2'
  checksumType  = 'sha256'
  checksum64    = '8AB585BF5EA887AF858B59693A38B9D572D9BF6B843F5DB30CD0186E9EC87608'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" IACCEPTMSOLEDBSQLLICENSETERMS=YES"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs