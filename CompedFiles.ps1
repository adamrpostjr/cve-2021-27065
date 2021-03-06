# ---------------------------------------------

#  Single line scripts that will check each of 
#  the common directorys.
#  More Information above the one liners

#  Each of the below scripts will output a file 
#  On in the Temp folder on the root of C:\
#  the file will be in .csv format

# ---------------------------------------------

# This is the install path for exchange normaly files are deep inside here so we will scan the whole thing
Get-ChildItem -Path $env:exchangeinstallpath -Recurse –force -ErrorAction SilentlyContinue | Select-String -Pattern "\w*:\/\/\w\/<\w*\s.*<.*>" -AllMatches -List -ErrorAction SilentlyContinue | Select-Object Path, Line | Export-Csv -Path C:\Temp\CompedFiles-ExchangeDirectory.csv -NoTypeInformation

# This is IIS Path files have been found all thoughout we will scan all of it.
Get-ChildItem -Path C:\inetpub\wwwroot\ -Recurse –force -ErrorAction SilentlyContinue | Select-String -Pattern "\w*:\/\/\w\/<\w*\s.*<.*>" -AllMatches -List -ErrorAction SilentlyContinue | Select-Object Path, Line | Export-Csv -Path C:\Temp\CompedFiles-InetPubDirectory.csv -NoTypeInformation

# Personally did not find this path on any server but it has been reported
Get-ChildItem -Path C:\Exchange\ -Recurse –force -ErrorAction SilentlyContinue | Select-String -Pattern "\w*:\/\/\w\/<\w*\s.*<.*>" -AllMatches -List -ErrorAction SilentlyContinue | Select-Object Path, Line | Export-Csv -Path C:\Temp\CompedFiles-