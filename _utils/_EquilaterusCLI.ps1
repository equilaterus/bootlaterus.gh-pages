# Equilaterus CLI-Tools for Powershell
# v1.0.0
# MIT License
# https://github.com/equilaterus/cli-tools-powershell

Push-Location .
Push-Location -Path $PSScriptRoot

Function Pop-Cli {
    param (
        [Parameter(Mandatory=$true)][int] $MaxPops
    )

    while ($i -lt $MaxPops) {
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
        [Parameter(Mandatory=$true)][string] $Title,
        [Parameter(Mandatory=$true)][bool] $SkipLicense
    )
    if (!$SkipLicense) {
        Write-Host 'MIT License'
        Write-Host 'Equilaterus CLI-Tools v1 for PowerShell'    
        Write-Cli-Line
    }
    Write-Host
    Write-Host $Title
}

Function Exit-Cli {
    param (
        [Parameter(Mandatory=$true)][int] $MaxPops
    )

    Pop-Cli -MaxPops $MaxPops
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
        $AlternativePath = '..',
        $MaxPopsOnExit = 10,
        $SkipIntro = $false,
        $SkipLicense = $false
    )

    try {
        if (!$SkipIntro) {
            Write-Cli-Intro -Title $Title -SkipLicense $SkipLicense
        }

        Write-Cli-Step -Step 'Preparing CLI'
        Set-Cli-Path -Filename $Filename -AlternativePath $AlternativePath

        Write-Cli-Step -Step 'Executing Script'
        Invoke-Script
    } catch {
        Write-Error $_.Exception.ToString()
    } finally {
        Exit-Cli -MaxPops $MaxPopsOnExit
    }
}
