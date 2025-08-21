# ===============================
# Windows Incident Response Script (PowerShell)
# ===============================

# 결과 저장 경로
$Output = Join-Path -Path $PSScriptRoot -ChildPath "Windows_IR"
New-Item -Path $Output -ItemType Directory -Force | Out-Null

# 로그 시작
"[*] Incident Response Collection Started $(Get-Date)" | Out-File "$Output\log.txt"

# --- System Info ---
systeminfo | Out-File "$Output\systeminfo.txt"
Get-ComputerInfo | Out-File "$Output\computerinfo.txt"
Get-Process | Out-File "$Output\processes.txt"
Get-Service | Out-File "$Output\services.txt"

# --- Network Info ---
ipconfig /all | Out-File "$Output\network.txt"
arp -a | Out-File "$Output\arp.txt"
Get-NetTCPConnection | Out-File "$Output\netstat.txt"

# --- Users & Logons ---
Get-CimInstance -ClassName Win32_LoggedOnUser | Out-File "$Output\loggedon_users_cim.txt"
Get-LocalUser | Out-File "$Output\users.txt"
Get-LocalGroupMember -Group "Administrators" | Out-File "$Output\local_admins.txt"

# --- Scheduled Tasks ---
Get-ScheduledTask | Out-File "$Output\scheduled_tasks.txt"

# --- Persistence (Registry) ---
Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" `
  | Out-File "$Output\reg_run_hklm.txt"
Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
  | Out-File "$Output\reg_run_hkcu.txt"

# --- Autoruns (Startup Folders) ---
Get-ChildItem "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" `
  | Out-File "$Output\startup_global.txt"
Get-ChildItem "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" `
  | Out-File "$Output\startup_user.txt"

# 로그 종료
"[*] Incident Response Collection Finished $(Get-Date)" | Out-File "$Output\log.txt" -Append
