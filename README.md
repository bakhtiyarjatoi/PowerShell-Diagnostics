# PowerShell Diagnostics Script

This repository contains a PowerShell script for system diagnostics. The script collects and exports various system information, such as network configuration, DNS settings, running processes, disk usage, installed applications, system uptime, and more. The data is saved into CSV files for analysis or reporting.

## Features

- **System Information**: Provides details about the computer's name, OS, architecture, and memory.
- **Network Configuration**: Retrieves network adapter configurations.
- **DNS Configuration**: Lists DNS client settings.
- **Running Processes**: Displays running processes sorted by CPU usage.
- **Running Services**: Lists all currently running services.
- **Event Logs**: Captures system errors from the last 24 hours.
- **Disk Usage**: Shows disk usage details (used, free, and total space).
- **Installed Applications**: Lists all installed applications with details.
- **Hotfixes and Patches**: Provides a list of installed hotfixes.
- **System Uptime**: Displays the time since the last system boot.
- **User Accounts**: Lists all local user accounts on the system.

## Requirements

- **PowerShell Version**: 5.0 or later
- **Permissions**: Administrator privileges are required for some diagnostic commands.
- **Dependencies**: Uses built-in PowerShell cmdlets; no external modules are required.

## Usage

1. **Clone the Repository**  
   Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/PowerShell-Diagnostics.git
   ```

2. **Navigate to the Script Directory**  
   ```bash
   cd PowerShell-Diagnostics
   ```

3. **Run the Script**  
   Execute the script in PowerShell:
   ```bash
   .\DiagnosticScript.ps1
   ```

4. **View Output**  
   The script generates multiple CSV files in the same directory, each containing specific system diagnostics.

## Example Output

The following CSV files will be created in the directory where the script is executed:

- `SystemInfo.csv`
- `NetworkConfig.csv`
- `DNSConfig.csv`
- `RunningProcesses.csv`
- `RunningServices.csv`
- `EventLogs.csv`
- `DiskUsage.csv`
- `InstalledApps.csv`
- `Hotfixes.csv`
- `SystemUptime.csv`
- `UserAccounts.csv`

Each file provides detailed diagnostics data for its respective category.

## License

This script is provided as-is. Feel free to use, modify, and distribute it under your preferred terms.

## Contact

For questions or feedback, please open an issue or contact me via email:  
📧 [khankhanbakhtiyar@gmail.com](mailto:khankhanbakhtiyar@gmail.com)


*Script made with ❤️ by Bakhtiyar Ahmad*

