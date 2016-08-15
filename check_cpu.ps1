# Checks CPU & Memory and reports highest utililzation process if warn/crit
param([int] $warn = 80, [int] $critical = 90)

#This is to allow this to function properly in both PowerShell 2 and PowerShell 3 and beyond
if (!$PSScriptRoot) {
        $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition -Parent
    }

. (Join-Path $PSScriptRoot checks_helper.ps1)


Perform-Counter-Check -counterPath "\Processor(_Total)\% Processor Time" -outputstring "CPU at {0} %"  -warn $warn -critical $critical
