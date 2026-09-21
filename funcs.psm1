Import-Module "$PSScriptRoot\typehost.psm1" -Force

[int]$Global:playerwins = 0
[int]$Global:machinewins = 0

[array]$rpl = @('rock', 'paper', 'scissors')



function rulemaster
([string]$machineChoice, [string]$playerChoice)
{
    switch ($playerChoice, $machineChoice){
        ("rock","paper"){$Global:machinewins++}
        ("paper","scissors"){$Global:machinewins++}
        ("scissors","rock"){$Global:machinewins++}

        ("paper","rock"){$Global:playerwins++}
        ("scissors","paper"){$Global:playerwins++}
        ("rock","scissors"){$Global:playerwins++}
    }
}

function onegame
{
    $playerChoice = Read-Robo "your move"
    while ($playerChoice.ToLower() -notin $rpl){
        Write-Robo "rock/paper/scissors are valid inputs" -color "red" -time 1
        start-sleep -Seconds 1
        $playerChoice = Read-Robo "your move"
    }
    Start-Sleep -Seconds 0.5
    
    $choice = Get-Random -Maximum 3 -Minimum -0
    $machineChoice = $rpl[$choice]
    Write-Robo "I choose $machinechoice" -color "cyan"
    Start-Sleep -Seconds 0.5

    rulemaster($playerChoice, $machineChoice)
}

function gamemaster([int]$total)
{
    for($counter = 1; $counter -le $total; $counter++){
        onegame
        Start-Sleep -Seconds 0.5
    }
    Start-Sleep -Seconds 1    

    if ($Global:playerwins -gt $Global:machinewins){
        Write-Robo "You won the game" -color "green"
    }elseif ($Global:playerwins -eq $Global:machinewins){
        Write-Robo "It was a draw" -color "gray"
    }else{
        Write-Robo "Alas! you lose the game" -color "Darkred"
    }
    Start-Sleep -Seconds 1
}
