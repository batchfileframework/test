function myprint { param ( [string]$myinput ) write-host "Printing text using a function argument :$myinput"; } 
write-host 'before'; 
myprint ("This test worked correctly"); 
write-host 'after';