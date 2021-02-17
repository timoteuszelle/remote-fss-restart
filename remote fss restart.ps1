<#
Author: Tim Zelle
Safe restart of Fss Launcher for FEWS.
#> 
Get-Process -name -like *delft* | Stop-Process
Get-ChildItem -Path "D:\fews\fss" -Recurse | Where-Object {$_.Name -like "*Running"} | Remove-Item -Force