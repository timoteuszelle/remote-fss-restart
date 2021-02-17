<#
Author: Tim Zelle
Safe restart of Fss Launcher for FEWS.
#> 
$Computer = (Read-Host)
Invoke-Command -ComputerName $Computer -ScriptBlock {
    Get-Service -Name FssLauncher | Stop-Service
    Get-Process -name fssLauncherService | Stop-Process -Force
    Get-ChildItem -Path "D:\fews\fss" -Recurse | Where-Object {$_.Name -like "*Running*", "*log*","awake"} | Remove-Item -Force
    Get-Service -Name FssLauncher | Start-Service
}