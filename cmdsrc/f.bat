@echo off

REM 遅延環境変数展開を有効化（!VAR! を使うため）
setlocal enabledelayedexpansion

set "SCRIPT_DIR=%~dp0"
set "TOOL_ROOT=%SCRIPT_DIR%..\"

REM メモ帳とか秀丸とかサクラエディタとかVSCodeとかお好みのエディタパスを入れる
if not exist "%EDITOR%" (
    set "EDITOR=notepad.exe"
)

REM 今日の日付を取得（例: 2025/07/12 の形式を想定）
set "today=%date%"

REM 日付をパーツに分解（形式により必要なら調整）
for /f "tokens=1-3 delims=/- " %%a in ("%today%") do (
    set "yyyy=%%a"
    set "m0=%%b"
    set "d0=%%c"
)

REM ゼロサプレスなし（先頭0を削除）
set /a m=!m0!  >nul
set /a d=!d0!  >nul

REM このファイル自身を開く
if "%1"=="f" (
	start "" "%EDITOR%" "%SCRIPT_DIR%\f.bat"
	exit /b
)

REM cmdフォルダを開く
if "%1"=="cmd" (
    	start "" "!TOOL_ROOT!cmd"
	exit /b
)

REM cmdrscフォルダを開く
if "%1"=="cmdsrc" (
    start "" "%SCRIPT_DIR%"
    exit /b
)

REM クリップボード用テンプレートフォルダを開く
if "%1"=="c" (
    start "" "%TOOL_ROOT%\c"
    exit /b
)

REM スクリーンショットフォルダを開く
if "%1"=="sc" (
	explorer shell:Screenshots
	exit /b
)

REM 新規Googleスプレッドシートを開く
if "%1"=="ns" (
    start "" "https://sheet.new"
    exit /b
)


if "%1"=="html" (
	start "" "https://yv.socoda.net/tools/html.html"
	exit /b
)

if "%1"=="tl" (
    start "" "https://scrapbox.io/shino/!yyyy!%%2F!m!%%2F!d!"
    exit /b
)

