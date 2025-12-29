@echo off

REM 遅延環境変数展開を有効化（!VAR! を使うため）
setlocal enabledelayedexpansion

REM 引数がなければエラー
if "%~1"=="" (
    echo 使用方法: c [ファイル名（拡張子なし）]
    exit /b 1
)

REM フォルダとファイル名を構築
REM この bat の場所（cmdsrc\）
set "SCRIPT_DIR=%~dp0"

REM @tool\c フォルダ
set "TARGET_DIR=%SCRIPT_DIR%..\c"

set "TARGET_FILE=%~1.txt"
set "FULL_PATH=%TARGET_DIR%\%TARGET_FILE%"

REM ファイルが存在するか確認
if not exist "!FULL_PATH!" (
    echo エラー: "!FULL_PATH!" が見つかりません。
    exit /b 1
)

REM PowerShellを使って中身をクリップボードにコピー
powershell -NoProfile -Command "Get-Content -Raw -Encoding UTF8 -Path '%FULL_PATH%' | Set-Clipboard"

echo コピーしました: %FULL_PATH%
endlocal