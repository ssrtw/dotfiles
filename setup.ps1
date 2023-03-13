# 檢查當前是否以系統管理員身份運行
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $choice = Read-Host "Do you want to run PowerShell as an administrator? [Y/N]"
    if ($choice -eq "Y") {
        # 以系統管理員身份開啟新的 PowerShell 進程，並使用系統管理員權限運行當前的腳本
        Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$($MyInvocation.MyCommand.Path)`"" -Verb "RunAs"
        Exit
    } else {
        Exit
    }
}

# 設定 PowerShell 5 的 Policy
reg add HKCU\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v "ExecutionPolicy" /t REG_SZ /d RemoteSigned /f
reg add HKLM\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v "ExecutionPolicy" /t REG_SZ /d RemoteSigned /f

# 設定檔案總管
$reg_explorer_path = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
# 顯示隱藏檔案
reg add $reg_explorer_path /v Hidden /t REG_DWORD /d 1 /f
# 顯示副檔名
reg add $reg_explorer_path /v HideFileExt /t REG_DWORD /d 0 /f

# 下載 FiraCode Nerd Font ZIP 檔案
$url = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
$output = "$env:TEMP\FiraCode.zip"
Invoke-WebRequest -Uri $url -OutFile $output
# 解壓縮 ZIP 檔案
$zipfile = Get-ChildItem -Path $output -File
Expand-Archive -LiteralPath $zipfile.FullName -DestinationPath "$env:TEMP\FiraCode"

# 安裝字型: https://blog.simontimms.com/2021/06/11/installing-fonts/
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
$fonts_path = "$env:TEMP\FiraCode\*.ttf"
foreach ($file in gci $fonts_path)
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\Fonts\$fileName" )) {
        echo $fileName
        dir $file | %{ $fonts.CopyHere($_.fullname) }
    }
}
cp $fonts_path "C:\Windows\Fonts\"

# 移除暫存檔案
Remove-Item -Path "$env:TEMP\FiraCode.zip" -Force
Remove-Item -Path "$env:TEMP\FiraCode" -Recurse -Force

# 下載 starship
if (-not (Test-Path -Path "$HOME\.local\bin\starship.exe")) {
    $url = "https://github.com/starship/starship/releases/latest/download/starship-x86_64-pc-windows-msvc.zip"
    $zipfile = "$env:TEMP\starship.zip"
    $install_dir = "$HOME\.local\bin"

    Write-Host "Downloading Starship from $url..."
    Invoke-WebRequest -Uri $url -OutFile $zipfile

    Write-Host "Extracting Starship to $install_dir..."
    Expand-Archive -Path $zipfile -DestinationPath $install_dir -Force

    Write-Host "Cleaning up temporary files..."
    Remove-Item -Path $zipfile

    Write-Host "Starship installed successfully!"

    cp ".\starship.toml" "$HOME\starship.toml"
}

# 下載並執行 CTT 的安裝程式
irm christitus.com/win | iex

# 寫入 PowerShell 7 的設定檔
$powershell_folder = [Environment]::GetFolderPath("MyDocuments") + "\PowerShell"
# 檢查路徑
if (-not (Test-Path $powershell_folder -PathType Container)) {
    New-Item -Path $powershell_folder -ItemType Directory | Out-Null
}
cp ".\win\profile.ps1" $powershell_folder

# 設定 PowerShell 7 的 Policy
if ((Test-Path $powershell_folder -PathType Container)) {
    # 定義要讀取和寫入的檔案路徑
    $jsonFile = "C:\Program Files\PowerShell\7\powershell.config.json"
    # 讀取 JSON 檔案
    $jsonData = Get-Content $jsonFile | ConvertFrom-Json
    # 修改指定屬性的值
    $jsonData."Microsoft.PowerShell:ExecutionPolicy" = "RemoteSigned"
    # 寫回 JSON 檔案
    $jsonData | ConvertTo-Json -Compress | Set-Content $jsonFile
}