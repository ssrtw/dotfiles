Invoke-Expression (&"$HOME\.local\bin\starship.exe" init powershell)

$ENV:STARSHIP_CONFIG = "$HOME\starship.toml"

Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit