# Baseline Monitoring Script

<br>

## Overview

Welcome to the Baseline Monitoring Script! This PowerShell script is designed to collect and save essential system information for monitoring purposes. It creates a structured set of directories and files containing details about tasks, system information, installed software, user accounts, drivers, scheduled tasks, and network configuration. Ideal for system administrators and IT professionals for system monitoring and auditing.


## Table of Contents

- [Why Use This Script](#why-use-this-script)
- [Languages and Utilities Used](#languages-and-utilities-used)
- [Environments Used](#environments-used)
- [Prerequisites](#prerequisites)
- [Setting Execution Policy](#setting-execution-policy)
- [Instructions](#instructions)
- [File Structure and Outputs](#file-structure-and-outputs)
- [Customization Options](#customization-options)
- [Comparative Analysis for Cybersecurity](#comparative-analysis-for-cybersecurity)
- [Program Walk-Through](#program-walk-through)


## Why Use This Script

The ability to compare system states at different times is crucial for maintaining cybersecurity. By using this script to take periodic snapshots of a system, administrators can identify unexpected changes that might signal a security issue.

- **Organized Monitoring**: Automatically creates folders and files for each day of monitoring, making it easy to keep track of historical data.
- **Comprehensive Information Collection**: Gathers a wide range of system information necessary for detailed monitoring.
- **User Input Integration**: Allows for user input to document the reason for running the script, adding context to the monitoring data.

<br>

## Languages and Utilities Used

- **PowerShell**

[<img alt="PowerShell Icon" width="50px" src="https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true" />][powershell]

[powershell]: https://learn.microsoft.com/en-us/powershell/

## Environments Used

- **Windows**

[<img align="left" alt="Microsoft Icon" width="35px" src="https://upload.wikimedia.org/wikipedia/commons/3/34/Windows_logo_-_2012_derivative.svg" />][windows]

[windows]: https://www.microsoft.com/

## Prerequisites

- PowerShell environment on a Windows system.
- **Administrative Privileges**: Necessary for accessing certain system information and executing specific commands.

<br>

## Setting Execution Policy

To run this script, you may need to set the PowerShell execution policy. This can be done in several ways, depending on your security requirements:

1. **RemoteSigned**: Allows running scripts signed by a trusted publisher.

   ````powershell
   Set-ExecutionPolicy RemoteSigned
   
2. **Unrestricted**: Allows running all scripts. Use with caution.

   ````powershell
   Set-ExecutionPolicy Unrestricted
   
3. **Bypass**: Temporarily bypasses the policy to run the script without changing the policy.

   ````powershell
   PowerShell.exe -ExecutionPolicy Bypass -File .\baseline.ps1

<br>

## Instructions

- **Set Up Script**: Download the `baseline.ps1` script to your local machine.
- **Run the Script**: Open PowerShell as an administrator, navigate to the script's directory, and execute the script.
  
   ````powershell
   .\baseline.ps1
   
- **Enter Reason**: When prompted, enter the reason for running this script. This will be recorded in the monitoring files.
- **Review Outputs**: After the script completes, check the `$monitoringFolder` for the generated reports.

<br>

## File Structure and Outputs

- **Monitoring Folder**: A main folder named `C:\Monitoring` is created.
- **Date Folders**: Inside the main folder, subfolders are created for each day the script is run, labeled with the date.
- **Information Files**: Each task's output is saved in a separate text file, labeled with the task name.
- **Special Files**: An `info.txt` file contains the date, time, and user-entered reason for running the script.

<br>

## Customization Options

- **Folder Location**: Modify `$monitoringFolder` to change where the monitoring files are saved.
- **Additional Tasks**: Add or modify tasks in the `$tasks` array to collect different or additional information.

<br>

## Comparative Analysis for Cybersecurity

A key advantage of this script is its capability to facilitate comparative analyses over time. By running the script at different intervals, you can generate snapshots of the system's state, which can then be compared using tools like PowerShell's `Compare-Object` cmdlet. This comparative analysis is invaluable in cybersecurity, allowing for the detection of changes and potential anomalies in the system that could indicate security breaches or system misconfigurations.
PowerShell is instrumental in comparing system snapshots taken at different intervals. This is a key aspect for identifying changes that may signal security concerns. Here's a brief guide on how I achieve this:

1. **Run the Script Multiple Times**: The script is executed periodically to generate sets of monitoring files, stored in date-labeled subfolders within the `$monitoringFolder`.

2. **Select Files for Comparison**: Choose specific files from these snapshots for comparison, such as 'InstalledSoftware\_.txt'.

3. **Compare Using PowerShell**: This command compares the contents of the installed software list from January 1st, 2023, and February 1st, 2023.

   ````powershell
   $File1 = Get-Content -Path "C:\Monitoring\20230101\InstalledSoftware_.txt"
   $File2 = Get-Content -Path "C:\Monitoring\20230201\InstalledSoftware_.txt"

   Compare-Object -ReferenceObject $File1 -DifferenceObject $File2

<br>
   
## Program Walk-Through

<p align="center">
<b>Launch PowerShell (as Administrator). Get/Set Execution Policy and run the file "baseline.ps1": </b>
<br/>  
<br/>
<img src="https://github.com/infinity-set/infinity-set/assets/142350896/b64fd1ca-3e94-4a31-bb7f-6542da430100 " height="80%" width="80%" alt="Run PowerShell Script"/>
<br />
<br />
<b>Follow prompts: </b>
<br/>
<br/>
<img src="https://github.com/infinity-set/infinity-set/assets/142350896/eb4e0445-c7ad-4607-9822-e0586e8b5c6a " height="80%" width="80%" alt="Follow Prompts"/>
<br />
<br />
<b>Navigate to “C:\Monitoring\” folder. You will find sub-folders when you run the script: </b>
<br/>
<br/>
<img src="https://github.com/infinity-set/infinity-set/assets/142350896/79607486-6e53-442e-88b8-ba18bf31601d " height="80%" width="80%" alt="Folder Location Picture"/>
<br/>  
<br />
<b>Revert the Execution Policy back to its original state: </b>
<br/>
<br/>
<img src="https://github.com/infinity-set/infinity-set/assets/142350896/3566db65-bf1b-4ddc-ab56-ae10735178c9" height="100%" width="80%" alt="Reset Execution Policy"/>
<br />
<br />  
</p>
<br>
<br>
   
#

⬅️ **[Home](https://github.com/infinity-set)**
