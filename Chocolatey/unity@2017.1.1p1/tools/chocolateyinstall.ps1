﻿$ErrorActionPreference = 'Stop';

$packageName        = 'unity@2017.1.1p1'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/007fc09e806c/Windows64EditorInstaller/UnitySetup64-2017.1.1p1.exe'
$checksum64         = '769b19cd75ebd13df91bc8f374514097e789aa4112f411bca178d188fda6eb4f'

$args = '/S'

$pp = Get-PackageParameters
if ($pp.InstallationPath) {
    $args += " /D=$($pp.InstallationPath)"
    Write-Host "Param: Installing to $($pp.InstallationPath)"
}

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'Unity'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = $args
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
