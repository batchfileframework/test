

::Usage Call :Install DELETETEMPFILES softwarename optional usercommandsfolder optional destinationroot optional destinationfolder

check internal lookup for software definition
create folder
create version subfolder
create package subfolder
create version subfolder in package folder
download package files to package subfolder   folder\package\version\
use system proxy settings if needed
uncompress and copy relevant files to destinationroot\destinationfolder\version\
hardlink all relevant files in destinationroot\destinationfolder\
hardlink all relevant files to userfolder

::Usage Call :GetSoftwareDetails softwarename Details.object
:GetSoftwareDetails softwarename

software name
description
latest.version
latest.sourceURL[]
latest.signature
latest.signature.type
knownversions[].versions
knownversions[].signature
knownversions[].signature.type

if "[%~1]" EQU "[ffmpeg-essentials-by-gyan.dev]"
if "[%~1]" EQU "[ffmpeg-full-by-gyan.dev]"


set "%~2[0].name=FFmpeg"
set "%~2[].description=Fast Forward MPEG"
set "%~2[].version=2023-09-07-git-9c9f48e7f2"
set "%~2[].sourceURLs[]
set "%~2[].signatureURLs[]
set "%~2[].installcommands[]
set "%~2[].signature
set "%~2[].signature.type
set "%~2.ubound
https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-full_build.zip
https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-essentials_build.zip
https://github.com/GyanD/codexffmpeg/releases/download/2023-09-07-git-9c9f48e7f2/ffmpeg-2023-09-07-git-9c9f48e7f2-essentials_build.zip
https://github.com/GyanD/codexffmpeg/releases/download/2023-09-07-git-9c9f48e7f2/ffmpeg-2023-09-07-git-9c9f48e7f2-full_build.zip
set "%~2.name="
set "%~2.description="
set "%~2.version
set "%~2.sourceURLs[]
set "%~2.installcommands[]
set "%~2.signature
set "%~2.signature.type

if "[%~1]" EQU "[ffmpeg-essentials-by-BtbN]"

if "[%~1]" EQU "[ffmpeg-full-by-BtbN]"