@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ver="
set /p ver=Enter version:
if "%ver%"=="" (
  echo ERROR: Version cannot be empty.
  exit /b 1
)

set "verNoV=%ver%"

set "PACK1=Advancement Contest Datapack"
set "PACK2=Advancement Contest Resources"

if not exist "%CD%\%PACK1%\libs\" (
  echo ERROR: "%PACK1%\libs" not found.
  exit /b 1
)
if not exist "%CD%\%PACK1%\edat\" (
  echo ERROR: "%PACK1%\edat" not found.
  exit /b 1
)
if not exist "%CD%\%PACK1%\" (
  echo ERROR: Folder not found: "%CD%\%PACK1%"
  exit /b 1
)
if not exist "%CD%\%PACK2%\" (
  echo ERROR: Folder not found: "%CD%\%PACK2%"
  exit /b 1
)

if not exist "%CD%\%PACK1%\data\" (
  echo ERROR: "%PACK1%\data" not found.
  exit /b 1
)
if not exist "%CD%\%PACK1%\pack.mcmeta" (
  echo ERROR: "%PACK1%\pack.mcmeta" not found.
  exit /b 1
)

set "ZIP1=%CD%\Adv Contest Datapack %verNoV%.zip"
set "ZIP2=%CD%\Adv Contest Resources %verNoV%.zip"

if exist "%ZIP1%" del /f /q "%ZIP1%" >nul 2>&1
if exist "%ZIP2%" del /f /q "%ZIP2%" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "Add-Type -AssemblyName System.IO.Compression | Out-Null;" ^
  "Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null;" ^
  "function NormalizeZip([string]$zip){" ^
  "  $tmp=[IO.Path]::Combine([IO.Path]::GetDirectoryName($zip),([IO.Path]::GetFileNameWithoutExtension($zip)+'.tmp.zip'));" ^
  "  if(Test-Path -LiteralPath $tmp){Remove-Item -LiteralPath $tmp -Force};" ^
  "  $in=[System.IO.Compression.ZipFile]::OpenRead($zip);" ^
  "  $out=[System.IO.Compression.ZipFile]::Open($tmp,'Create');" ^
  "  try{foreach($e in $in.Entries){" ^
  "    $name=$e.FullName -replace '\\','/';" ^
  "    if($name.EndsWith('/')){[void]$out.CreateEntry($name);continue};" ^
  "    $ne=$out.CreateEntry($name,[System.IO.Compression.CompressionLevel]::Optimal);" ^
  "    $ne.LastWriteTime=$e.LastWriteTime;" ^
  "    $sIn=$e.Open(); $sOut=$ne.Open();" ^
  "    try{$sIn.CopyTo($sOut)}finally{$sOut.Dispose();$sIn.Dispose()}" ^
  "  }}finally{$out.Dispose();$in.Dispose()};" ^
  "  Move-Item -LiteralPath $tmp -Destination $zip -Force;" ^
  "}" ^
  "function ZipPaths([string[]]$paths,[string]$zip){" ^
  "  if(Test-Path -LiteralPath $zip){Remove-Item -LiteralPath $zip -Force};" ^
  "  $rp=@(); foreach($p in $paths){$rp+=(Resolve-Path -LiteralPath $p).Path};" ^
  "  Compress-Archive -LiteralPath $rp -DestinationPath $zip -CompressionLevel Optimal;" ^
  "  NormalizeZip $zip;" ^
  "}" ^
  "function ZipFolderContents([string]$dir,[string]$zip){" ^
  "  $dir=(Resolve-Path -LiteralPath $dir).Path;" ^
  "  $items=Get-ChildItem -LiteralPath $dir -Force;" ^
  "  if(-not $items){throw ('No items found in: '+$dir)};" ^
  "  ZipPaths ($items.FullName) $zip;" ^
  "}" ^
  "$pack1=Join-Path $PWD '%PACK1%';" ^
  "$pack2=Join-Path $PWD '%PACK2%';" ^
  "ZipPaths @((Join-Path $pack1 'data'),(Join-Path $pack1 'libs'),(Join-Path $pack1 'edat'),(Join-Path $pack1 'pack.mcmeta')) '%ZIP1%';" ^
  "ZipFolderContents $pack2 '%ZIP2%';"

if errorlevel 1 (
  echo ERROR: Packaging failed.
  exit /b 1
)

if not exist "%ZIP1%" (
  echo ERROR: Expected zip not created: "%ZIP1%"
  exit /b 1
)
if not exist "%ZIP2%" (
  echo ERROR: Expected zip not created: "%ZIP2%"
  exit /b 1
)

echo.
echo Done:
echo   "%ZIP1%"
echo   "%ZIP2%"
exit /b 0
