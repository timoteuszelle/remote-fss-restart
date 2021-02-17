<#
Author: Tim Zelle
Safe restart of Fss Launcher for FEWS.
#> 
$Computer = (Read-Host)
Invoke-Command -ComputerName $Computer -ScriptBlock {
    Get-Service -Name *delft* | Stop-Service
    Get-Process -name *delft* | Stop-Process
    Get-ChildItem -Path "D:\fews\fss" -Recurse | Where-Object {$_.Name -like "*Running*", "*log*"} | Remove-Item -Force
    Get-Service -Name *delft* | Start-Service
}