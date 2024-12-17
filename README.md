# PowerShell Diagnostics Script

This repository contains a PowerShell script for system diagnostics. The script collects and exports various system information, such as network configuration, DNS settings, running processes, disk usage, installed applications, system uptime, and more. The data is saved into a CSV file for further analysis or reporting.

## Features

- **System Information**: Provides information about the computer's name, OS, architecture, and memory.
- **Network Configuration**: Outputs network adapter configurations.
- **DNS Configuration**: Lists DNS client settings.
- **Running Processes**: Displays running processes sorted by CPU usage.
- **Running Services**: Lists all running services.
- **Event Logs**: Captures system errors from the last 24 hours.
- **Disk Usage**: Shows disk usage details (used, free, and total space).
- **Installed Applications**: Provides a list of installed applications.
- **Hotfixes and Patches**: Lists installed hotfixes.
- **System Uptime**: Displays the system uptime since the last boot.
- **User Accounts**: Lists all local user accounts on the system.

## Requirements

- PowerShell version 5.0 or later
- Administrator privileges (for some diagnostic commands)
- No external modules required (built-in PowerShell cmdlets)

## Usage

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/PowerShell-Diagnostics.git
   ```

2. Navigate to the directory containing the script:
   ```bash
   cd PowerShell-Diagnostics
   ```

3. Run the script:
   ```bash
   .\DiagnosticScript.ps1
   ```

4. The script will generate a `DiagnosticsReport.csv` file in the same directory with the collected information.

## Example Output

The output will be saved to a CSV file in the same directory where the script is executed. It will contain sections like:

- System Information
- Network Configuration
- DNS Configuration
- Running Processes
- Installed Applications

## License

This script is provided as-is. Feel free to use, modify, and distribute under your own terms.

## Contact

For questions or feedback, please open an issue or contact me at [khankhanbakhtiyar@gmail.com](mailto:khankhanbakhtiyar@gmail.com).

---

*Tool developed and maintained by [Bakhtiyar Ahmad]*

```

### Customization:
- Replace `bakhtiyarjatoi` in the `git clone` command with your actual GitHub bakhtiyarjatoi.
- Replace `[khankhanbakhtiyar@gmail.com](mailto:khankhanbakhtiyar@gmail.com)` with your actual email if you'd like.
- Customize the "License" section if you intend to add a specific license for your script.

This README gives an overview of the script, its features, and how to use it. You can always modify it based on additional features or updates to the script.