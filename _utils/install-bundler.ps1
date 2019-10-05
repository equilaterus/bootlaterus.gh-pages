. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
    gem install bundler
}

Start-Cli -Title 'Install Bundler' -Filename 'Gemfile'
