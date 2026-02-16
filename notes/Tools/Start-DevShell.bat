@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0Start-DevShell.ps1"
Invoke-Expression (& "D:\Tools\Oh-My-Posh.exe" init pwsh --config "D:\Tools\paradox.omp.json")
