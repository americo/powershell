# set PowerShell to UTF-9
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
Import-Module posh-git
#Import-Module oh-my-posh

# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$omp_config = Join-Path $PSScriptRoot ".\themes\shell.omp.json"
oh-my-posh init pwsh --config $omp_config | Invoke-Expression > $null

# Terminal Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# FzF
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias edge MicrosoftEdge.exe
Set-Alias chrome 'C:\Program Files\Google\Chrome\Application\chrome.exe'
Set-Alias sed 'C:\Program Files (x86)\GnuWin32\bin\sed.exe'
Set-Alias pandoc 'C:\Program Files\Pandoc'
Set-Alias fleet 'C:\Users\Américo Júnior\AppData\Local\JetBrains\Toolbox\apps\Fleet\ch-0\1.9.237\app\bin\fleet.exe'

## Powershell Scripts
Set-Alias foundry 'C:\Users\Américo Júnior\pwsh-scripts/foundry.ps1'
Set-Alias eth-security-toolbox 'C:\Users\Américo Júnior\pwsh-scripts/eth-security-toolbox.ps1'
Set-Alias cut 'C:\Users\Américo Júnior\pwsh-scripts/cut.ps1'
Set-Alias linkfinder 'C:\Users\Américo Júnior\pwsh-scripts/linkfinder.ps1'

## Environment Variables
$env:CHROME = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$env:OPENAI_KEY = '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'