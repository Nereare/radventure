<#
.SYNOPSIS
	Install dependencies and run console
.DESCRIPTION
	This PowerShell script starts by installing any missing dependencies through Bundler, then it invokes the `console` script through Ruby.
.LINK
	https://github.com/Nereare/radventure
.NOTES
	Author: Igor Padoim | License: Unlicense
#>
Write-Host 'Installing dependencies...'
bundle install

Write-Host 'Now, run application...'
try {
  ruby bin\console
  exit 0
} catch {
  Write-Error '⚠️ Could not invoke ruby.'
  exit 1
}