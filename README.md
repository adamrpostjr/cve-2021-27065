# I will continue to add any new code or modify existing code based on searching for stolen data

If you have been compromised these scripts will by no means fix it for you!
These provide no benifit to you other than you now knowing the extent of what has happened to your system

With that being said I will contiinue to add scripts here that we are using in our research into what data could have been stolen from the system.

# Usefull links

1. https://www.bleepingcomputer.com/news/security/microsofts-msert-tool-now-finds-web-shells-from-exchange-server-attacks/
1. https://krebsonsecurity.com/2021/03/at-least-30000-u-s-organizations-newly-hacked-via-holes-in-microsofts-email-software/
1. https://www.huntress.com/blog/rapid-response-mass-exploitation-of-on-prem-exchange-servers
1. https://proxylogon.com/

# CVE-2021-27065

Quick One Line Powershell scripts to detect for webshells, possible zips, and logs.
Each of the scripts after running will ouput to a CSV located in the temp drive at the root of C:

# Quick Code Explination:

## CompedFiles.ps1

1. This will start at the path specified
1. Work it's way through each folder and find the files inside of it.
1. Each file that it hits it will then start checking the file for the pattern "\w*:\/\/\w\/<\w*\s._<._>"
1. Every match that it gets it will select the path to the file and the line in the file that it found
1. After selection it will write that to the CSV located int he temp folder at the root of C:

## LogChecker

1. This will start at the path specified
1. Work it's way through each folder and find the files inside of it.
1. Each file that it hits it will then start checking the file for the pattern "Set-OabVirtualDirectory"
   1. This may pick up more than what we want -- but its the best way I have at the moment
1. Every match that it gets it will select the path to the file and the line in the file that it found
1. After selection it will write that to the CSV located int he temp folder at the root of C:

## PossibleExfil

1. Starting at the root of C:
1. This will look through **every** directory for any thing with the file extention _zip_ or _tar_ or _gzip_ or _7z_ or _rar_ or _dmp_
   1. zip -- for any files that would have been zipped and pulled off the server
   1. tar -- for any folder that would have been tar'ed and pulled off the server
   1. gzip -- for any files that would have been gziped and pulled off teh server
   1. 7z -- for any files that would have been 7z and pulled off teh server
   1. rar -- for any files that would have been rar and pulled off teh server
   1. dmp -- any possible process dumps
1. This will of course pull way more than you will ever need to lookt through
1. This will be output to a CSV in the temp folder at the root of C:
   1. The great thing is that since its in a csv file we can sort by date
      1. our checks included anything that was back to septemeber of last year -- since there has been reports back to octber of last year

## Get AdUsers / Groups

1. These will query AD Groups and AD Users
1. By using this you will be able to tell if hackers had altered any AD Group or Created a New Admin User
1. This will be output to a CSV in the temp folder at the root of C:
