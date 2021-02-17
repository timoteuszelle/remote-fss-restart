<#
Author: Tim Zelle
Safe restart of Fss Launcher for FEWS.
#> 
$Computer = (Read-Host)
Invoke-Command -ComputerName $Computer -ScriptBlock {
Get-Process -name *delft* | Stop-Process
Get-ChildItem -Path "D:\fews\fss" -Recurse | Where-Object {$_.Name -like "*Running"} | Remove-Item -Force
}