# Equilaterus CLI-Tools for Powershell
# MIT License
# https://github.com/equilaterus/cli-tools-powershell

Push-Location .
Push-Location -Path $PSScriptRoot

Function Pop-Cli {
    # Just in case that multiple Pushes
    # Pop up to 10 times
    while ($i -lt 10) {            
        (Pop-Location)
        $i++
    }
}

Function Write-Cli-Line {
    Write-Host "`n====================================================="
}

Function Write-Cli-Step {
    param (
        [Parameter(Mandatory=$true)][string] $Step
    )
    Write-Cli-Line
    Write-Host
    Write-Host $('STEP: ' + $Step)
    Write-Host
}

Function Write-Cli-Intro {
    param (
        [Parameter(Mandatory=$true)][string] $Title
    )
    Write-Host 'MIT License'
    Write-Host 'Equilaterus CLI-Tools for PowerShell'
    Write-Cli-Line
    Write-Host
    Write-Host $Title
}

Function Exit-Cli {
    Pop-Cli
    Write-Cli-Line
    Write-Host "`nPress any key to quit..."
    [void][System.Console]::ReadKey($true)
}

Function Set-Cli-Path {
    param (
        [Parameter(Mandatory=$true)][string] $Filename,
        $AlternativePath = '..'
    )

    if (!(Test-Path -Path  $Filename)){
        Write-Host $('File not found: ' + $Filename)
        Write-Host $('Trying alternative path: "' + $AlternativePath + '"')

        Push-Location -Path $AlternativePath
        if (!(Test-Path -Path $Filename)) {
            Throw $('File not found: ' + $Filename)
        }
    }
    Write-Host $('File ' + $Filename +  ' Found! ') -BackgroundColor Green -ForegroundColor Black
    Write-Host $('Location: '+ (Get-Location))
}

Function Start-Cli {
    param (
        [Parameter(Mandatory=$true)][string] $Title,
        [Parameter(Mandatory=$true)][string] $Filename,
        $AlternativePath = '..'
    )

    try {
        Write-Cli-Intro -Title $Title

        Write-Cli-Step -Step 'Preparing CLI'
        Set-Cli-Path -Filename $Filename -AlternativePath $AlternativePath

        Write-Cli-Step -Step 'Executing Script'
        Invoke-Script
    } catch {
        Write-Error $_.Exception.ToString()
    } finally {
        Exit-Cli
    }    
}