# This script launches PowerShell with your Oh My Posh config from USB

# Get the USB root path (where this script is stored)
$usbRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Path to the Oh My Posh executable and config
$ompPath = Join-Path $usbRoot 'Tools\Oh-My-Posh.exe'
$configPath = Join-Path $usbRoot 'Tools\paradox.omp.json'

# Command to initialize PowerShell with the custom prompt
$initCmd = "& `"$ompPath`" init pwsh --config `"$configPath`""

# Launch a new PowerShell window with the prompt setup
Start-Process powershell -ArgumentList "-NoExit", "-Command", $initCmd
