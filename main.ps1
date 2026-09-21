Import-Module "$PSScriptRoot\funcs.psm1" -Force
Import-Module  "$PSScriptRoot\typehost.psm1" -Force
Import-Module "$PSScriptRoot\compatibility.psm1" -Force

$Global:numberOfTimes = $null

Clear-Host
Write-Robo "welcome to rock paper scissors game" -color "green"
Start-Sleep -Seconds 1
Clear-Host


while($true){
    $clearance = Read-Robo "Do you want to play the game?" -color "yellow"

    if ($clearance.ToLower() -eq "yes"){
        Clear-host
        break
    }elseif($clearance.ToLower() -eq "no"){
        Write-Robo "exiting from the game" -time 1
        Start-Sleep -Seconds 1
        Clear-Host
        exit 
    }else{
        Write-Robo "only yes/no is accepted as answer" -color "red" -time 1
        Start-Sleep -Seconds 1
        Clear-Host
    }
}

while($true){
    try {
        $number = Read-Robo "How many games do you want to play? " -color "yellow"
        $Global:numberOfTimes = [int]$number
        break
    }
    catch {
        Write-Robo "pls give integer values" -color "red" -time 1
        Start-Sleep -Seconds 1
        Clear-Host
    }
}
Clear-Host

gamemaster $numberOfTimes
Clear-Host

Write-Robo "[---------------------------------------------------------------------]" -color "yellow" -time 1
Write-Robo "your score: $Global:playerwins                   |||                  machine score:$Global:machinewins"
Write-Robo "[---------------------------------------------------------------------]" -color "yellow" -time 1


