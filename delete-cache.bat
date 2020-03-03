@echo off

REM　■環境変数設定
set USER_DIR=C:\Users\%username%\AppData\Local\

REM　■Office_Cache削除
rmdir /q /s %USER_DIR%Microsoft\Office\16.0\OfficeFileCache > nul 2>&1
rmdir /q /s %USER_DIR%Microsoft\Office\15.0\OfficeFileCache > nul 2>&1
rmdir /q /s %USER_DIR%Microsoft\Office\16.0\Licensing > nul 2>&1

REM　■Office-OneNote 削除
rmdir /q /s %USER_DIR%Microsoft\OneNote\16.0\cache > nul 2>&1

REM　■Temp削除
rmdir /q /s %USER_DIR%Temp > nul 2>&1

REM　■TerminalServer_Cache削除
rmdir /q /s "%USER_DIR%Microsoft\Terminal Server Client\cache" > nul 2>&1

REM　■IE_Temp削除
rmdir /q /s "%USER_DIR%Microsoft\Windows\Temporary Internet Files" > nul 2>&1

REM　■Thunderbird_Cache削除
query process | findstr thunderbird.exe
if %errorlevel%==1 (
for /r %USER_DIR%Thunderbird\Profiles %%x in (Cache) do rmdir /s /q "%%x" > nul 2>&1
)

REM ■Chrome キャッシュ情報削除
rmdir /q /s "Z:\%username%\AppData\Roaming\Chrome_Google\Default\Cache\" > nul 2>&1

REM ■Office365 トークン情報削除
set work_path="C:\Program Files\Scripts"
cscript "C:\Program Files\Scripts\o365regedl.vbe"

REM　■環境変数リセット
set USER_DIR=
