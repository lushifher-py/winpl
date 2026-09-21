Import-Module "$PSScriptroot\typehost.psm1" -Force

if(Get-Command pwsh -ErrorAction SilentlyContinue){
    Write-Robo "old version detected re-lauching with poweshell 7" -time 10 -color "red"
    pwsh -ExecutionPolicy Bypass -file "$MyInvocation.Mycommand.Path"
    exit 
}else{
    Write-Robo "This version runs on powershell 7"
    Write-Robo "Don't worry it will run on your system, but it is better to have
    powershell 7 if you want to run scripts like this"

    $ask = Read-Robo "Do you want to download pwsh 7?"

    if ($ask.ToLower -eq "yes"){
        Write-Robo "installing powershell 7 through winget... ... ..."

        winget install --id Microsoft.PowerShell --source winget --silent --accept-package-agreements --accept-source-agreements
        Write-Robo "Installation finished"
        pwsh -ExecutionPolicy Bypass -file "$MyInvocation.Mycommand.Path"
        exit
    }else{
        Write-Robo "Running on pwsh 5.1"
    }
}