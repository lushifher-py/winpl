function Write-Robo
{param(
    $text,
    $color = $null,
    $time = 100
)
    if ($null -eq $color){
        $color = $Host.UI.RawUI.ForegroundColor
    }

    foreach($char in $text.ToCharArray()){
    Write-Host $char -NoNewline -ForegroundColor $color
        start-sleep -Milliseconds $time
    }
    Write-Host ""
}

function Read-Robo
{param(
    $text,
    $color = $null,
    $time = 100
)
    if ($null -eq $color){
        $color = $Host.UI.RawUI.ForegroundColor
    }

    foreach($char in $text.ToCharArray()){
    Write-Host $char -NoNewline -ForegroundColor $color 
        start-sleep -Milliseconds $time
    }
    Read-Host " "
}


