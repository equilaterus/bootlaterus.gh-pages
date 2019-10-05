. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
    bundle install
}

Start-Cli -Title 'Install Site' -Filename 'Gemfile'
