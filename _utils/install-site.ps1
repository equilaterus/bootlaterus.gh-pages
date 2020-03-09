. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
  gem install bundler
  bundle install
}

Start-Cli -Title 'Install Site' -Filename 'Gemfile'
