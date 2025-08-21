### Windows Incident Response Script

### 📝 Overview

This PowerShell script is designed for **initial incident response on Windows systems**. It automatically collects critical system, network, user, and persistence-related data to provide a quick snapshot for analysis. All collected data is saved in text files within the `Windows_IR` directory.

### 🚀 How to Use

1.  Run the script (`Windows-IR.ps1`) with **administrator privileges**.
    ```powershell
    .\Windows-IR.ps1
    ```
2.  The collected data will be saved in the `Windows_IR` folder.

### 📂 Data Collected

  * **System Info**: `systeminfo`, `Get-ComputerInfo`
  * **Network Info**: `ipconfig`, `arp`, `Get-NetTCPConnection`
  * **Processes & Services**: All running processes and services.
  * **Users & Logons**: `query user`, `Get-LocalUser`, Local Administrators.
  * **Persistence**: Registry `Run` keys, Startup folders, and Scheduled Tasks.

### ⚠️ Important Notes

  * Must be run as an **administrator**.
  * This script is for initial data gathering only. Deeper forensic analysis requires specialized tools.
