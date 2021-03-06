# ---------------------------------------------

#  Single line scripts that will check each of 
#  the each of the log files for commands that 
#  Could have been run

#  The below scripts will output a file 
#  On in the Temp folder on the root of C:\
#  the file will be in .csv format

# ---------------------------------------------

Get-ChildItem -Path $env:exchangeinstallpath\Logging\ECP\Server\ -Recurse –force -ErrorAction SilentlyContinue | Select-String -Pattern "Set-OabVirtualDirectory" -AllMatches -List -ErrorAction SilentlyContinue | Select-Object Path, Line | Export-Csv -Path C:\Temp\ExecutedCMDs.csv -NoTypeInformation