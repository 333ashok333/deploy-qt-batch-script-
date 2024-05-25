
@echo off
REM ::Delete Build bin folder
REM set folder="C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin"
REM cd /d %folder%
REM for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
REM echo "Delete Build Bin Folder success "

REM ::Copy dlls to the Build folder
REM ROBOCOPY "C:\Program Files\PostgreSQL\15\bin" "C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin" /s *.dll
REM ROBOCOPY "C:\Program Files (x86)\VTK\bin" "C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin" /s *.dll
REM ROBOCOPY "C:\Skyline\qtapp-dev\3rdparty\aws\win\Release\bin" "C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin" /s *.dll

REM ::Deploying qt files
REM cd C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin
REM C:\Qt\5.15.16\msvc2019_64\bin\windeployqt --qmldir C:\Skyline\qtapp-dev\neutrace-app\qml C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin\NeuTrace.exe

REM ::Delete package bin folder
REM set folder2="C:\Skyline\NeuTrace_v3.0.2.13\packages\com.skyline.neutrace\data"
REM cd /d %folder2%
REM for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
REM echo "Bin Folder clear success "

REM ::Copy bin contents from build folder to the Package
REM ROBOCOPY "C:\Skyline\build-neutrace-Desktop_Qt_5_15_16_MSVC2019_64bit-Release\bin" "C:\Skyline\NeuTrace_v3.0.2.13\packages\com.skyline.neutrace\data" /s *.*

REM ::Set the installer version
cd C:\Skyline\NeuTrace_v3.0.2.13\config
setlocal enableextensions disabledelayedexpansion

    set "search=NeuTrace_v3.0.2.20"
    set "replace=NeuTrace_v3.0.2.15"

    set "textFile=config.XML"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        set "line=!line:%search%=%replace%!"
        >>"%textFile%" echo(!line!)
        endlocal
    )

cd C:\Skyline\NeuTrace_v3.0.2.13\packages\com.skyline.neutrace\meta

    set "search=NeuTrace_v3.0.2.20"
    set "replace=NeuTrace_v3.0.2.15"

    set "textFile=package.XML"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
   
        set "line=!line:%search%=%replace%!"
        >>"%textFile%" echo(!line!)
        endlocal
    )
cd C:\Skyline\NeuTrace_v3.0.2.13\packages\com.skyline.neutrace\meta
    set "search=NeuTrace_v3.0.2.19"
    set "replace=NeuTrace_v3.0.2.15"

    set "textFile=script.js"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        
        set "line=!line:%search%=%replace%!"
        >>"%textFile%" echo(!line!)
        endlocal
    )
echo "Edit version successfull"


REM ::Creating installer
REM cd C:\Skyline\NeuTrace_v3.0.2.13
REM C:\Qt\Tools\QtInstallerFramework\4.5\bin\binarycreator.exe -c config/config.xml -p packages NeuTrace_v3.0.2.18
