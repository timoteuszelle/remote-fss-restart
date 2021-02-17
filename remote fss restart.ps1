<#
Author: Tim Zelle
Safe restart of Fss Launcher for FEWS.
#> 
$Computer = (Read-Host)
$remotesession = New-PSSession -ComputerName $computer 
Invoke-Command -Session $remotesession -ScriptBlock {
    Get-Service -Name "FssLauncher" | Stop-Service
    Get-Process -ProcessName "fssLauncherService" | Stop-Process -Force
    Get-ChildItem -Path "D:\fews\fss" -Recurse | Where-Object {($_.Name -like "*Running*") -or ($_.Name -like "*log*") -or ($_.name -like "*awake*")} | Remove-Item -Force
    Get-Service -Name "FssLauncher" | Start-Service
}
Remove-PSSession $remotesession