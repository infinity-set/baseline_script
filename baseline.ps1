# Define the folder where the monitoring files will be saved
$monitoringFolder = "C:\Monitoring"

# Get the current date in a custom format for naming the subfolder and file header
$dateFolderName = Get-Date -Format "yyyyMMdd"
$dateHeader = $dateFolderName

# Get the current time for naming files
$timeHeader = Get-Date -Format "HH:mm:ss"

# Define the subfolder path
$subFolder = Join-Path -Path $monitoringFolder -ChildPath $dateFolderName

# Create the monitoring and subfolder if they don't exist
if (-not (Test-Path -Path $monitoringFolder)) {
    New-Item -Path $monitoringFolder -ItemType Directory -Force
}
if (-not (Test-Path -Path $subFolder)) {
    New-Item -Path $subFolder -ItemType Directory -Force
}

# Prompt the user for a reason for running the script
$userReason = Read-Host "Please enter the reason for running this script"

# Create the info file with the date header and user reason
$infoPath = Join-Path -Path $subFolder -ChildPath "info.txt"
"Date: $dateHeader Time: $timeHeader`nReason: $userReason" | Set-Content -Path $infoPath


# Define commands and file names in an array of hashtables
$tasks = @(
    @{Name = "TaskList"; Command = { Invoke-Expression -Command "tasklist" }},
    @{Name = "SystemInfo"; Command = { & systeminfo }},
    @{Name = "InstalledSoftware"; Command = { Get-WmiObject -Class Win32_Product | Select-Object -ExpandProperty Name }},
    @{Name = "UserAccounts"; Command = { & net user }},
    @{Name = "Drivers"; Command = { & driverquery }},
    @{Name = "ScheduledTasks"; Command = { & schtasks /query /fo list }}
    @{Name = "NetworkStats"; Command = { & netstat -anob }},
    @{Name = "Services"; Command = { & Get-Service | Select-Object -ExpandProperty Name }}
)

# Loop through each task
foreach ($task in $tasks) {
    Write-Host "Gathering $($task.Name)"
    $outputPath = Join-Path -Path $subFolder -ChildPath "$($task.Name).txt"
   
    if ($task.Name -eq "Services") {
        # Special handling for 'sc query' using Start-Process
        Start-Process -FilePath "sc" -ArgumentList "query" -NoNewWindow -RedirectStandardOutput $outputPath -Wait
    } else {
        # Execute the command and save the output
        & $task.Command | Set-Content -Path $outputPath
    }
}

# Gathering Network Configuration
Write-Host "Gathering Network Configuration"
$ipconfigOutputPath = Join-Path -Path $subFolder -ChildPath "NetworkConfiguration.txt"
ipconfig /all > $ipconfigOutputPath

# Display a message indicating that monitoring is complete
Write-Host "Monitoring complete. Results saved in $subFolder."