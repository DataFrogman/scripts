#Quintin Walters

#Lists the VMs on the system
function List-VMs {
    $Title = "List VMs"
    Write-Host "==================== $Title ===================="
    #lists vm
    Get-VM | Out-String

    Show-Menu
}

#Powers on a VM
function PowerOnVMs {
    $Title = "Start VM"
    Write-Host "==================== $Title ===================="
    Get-VM | Out-String
    $name = Read-Host "Which VM to power on"
    #starts the vm
    Start-VM -Name $name

    Show-Menu
}

#Powers off a VM
function PowerOffVMs {
    $Title = "Stop VM"
    Write-Host "==================== $Title ===================="
    Get-VM | Out-String
    $name = Read-Host "Which VM to power off"
    #stops the vm
    Stop-VM -Name $name

    Show-Menu
}

#Lists a VMs settings
function List-VMSettings {
    $Title = "List VM Settings"
    Write-Host "==================== $Title ===================="
    $name = Read-Host "Which VM to list settings"
    #gets vms settings
    Get-VM $name | Select-Object *

    Show-Menu
}

#Deletes a VM
function Delete-VM {
    $Title = "Delete VM"
    Write-Host "==================== $Title ===================="
    Get-VM | Out-String
    $name = Read-Host "Which VM to delete"
    #This deletes the vm
    Remove-VM -Name $name

    Show-Menu
}

#Creates a VM
function Create-VM {
    $Title = "Create VM"
    Write-Host "==================== $Title ===================="
    $name = Read-Host "Enter VM name"
    $ram = Read-Host "Enter amount of RAM in GB (1GB, 2GB, etc)"
    $ram = [int64]$ram.Replace('GB','') * 1GB
    $hdd = Read-Host "Enter Hard-Disk size in GB (1GB, 2GB, etc)"
    $hdd = [int64]$hdd.Replace('GB','') * 1GB
    $isopath = Read-Host "Enter ISO path"
    #Creates teh VM object
    New-VM -Name $name -Path "C:\Virtual Machines\$name" -MemoryStartupBytes $ram
    #creates teh hard disk
    New-VHD -Path "C:\Virtual Machines\$name\$name.vhdx" -SizeBytes $hdd -Dynamic
    #attaches the hard disk
    Add-VMHardDiskDrive -VMName $name -Path "C:\Virtual Machines\$name\$name.vhdx"
    #attaches the iso
    Set-VMDvdDrive -VMName $name -ControllerNumber 1 -Path $isopath
    #Starts the vm
    Start-VM -Name $name

    Show-Menu
}

#Shows the menu
function Show-Menu {
    $Title = 'Hyper-V Management'
    #Create the menu
    Write-Host "==================== $Title ===================="
    Write-Host "1: Press 1 to Create a VM."
    Write-Host "2: Press 2 to List Available VMs."
    Write-Host "3: Press 3 to Start a VM."
    Write-Host "4: Press 4 to Stop a VM."
    Write-Host "5: Press 5 to List a VM's Settings."
    Write-Host "6: Press 6 to Delete a VM."
    Write-Host "Q: Press Q to Quit the Program."

    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' {
            Create-VM
            }
        '2' {
            List-VMs
            }
        '3' {
            PowerOnVMs
            }
        '4' {
            PowerOffVMs
            }
        '5' {
            List-VMSettings
            }
        '6' {
            Delete-VM
            }
        'Q' {
            return
            }
        'q' {
            return
            }
    }
}

Clear-Host
Show-Menu

#Sources: Microsoft documentation