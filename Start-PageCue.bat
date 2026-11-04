@echo off
rem Double-click to run PageCue at http://localhost:8765 so the camera and mic work.
rem "-ExecutionPolicy Bypass" applies to this one script run only; it changes no settings.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-PageCue.ps1"
