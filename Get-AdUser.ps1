Get-ADUser -Filter * -Property whenCreated, whenChanged | Export-Csv -Path C:\Temp\AdUsers.csv -NoTypeInformation
