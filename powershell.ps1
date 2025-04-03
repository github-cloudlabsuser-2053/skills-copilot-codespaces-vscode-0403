# Variables
$resourceGroupName = "myResourceGroup"
$location = "EastUS"
$vmName = "myVM"
$adminUsername = "azureuser"
$adminPassword = "P@ssw0rd123!" # Replace with a secure password
$vmSize = "Standard_DS1_v2"
$networkName = "myVNet"
$subnetName = "mySubnet"
$ipName = "myPublicIP"
$nicName = "myNIC"
$imagePublisher = "Canonical"
$imageOffer = "UbuntuServer"
$imageSku = "18.04-LTS"

# Login to Azure (if not already logged in)
Connect-AzAccount

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a virtual network
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Location $location `
  -Name $networkName -AddressPrefix "10.0.0.0/16"

# Create a subnet
$subnet = Add-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.0.0/24" -VirtualNetwork $vnet
$vnet | Set-AzVirtualNetwork

# Create a public IP address
$publicIP = New-AzPublicIpAddress -ResourceGroupName $resourceGroupName -Location $location `
  -Name $ipName -AllocationMethod Dynamic

# Create a network interface
$nic = New-AzNetworkInterface -ResourceGroupName $resourceGroupName -Location $location `
  -Name $nicName -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIP.Id

# Create the virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize |
  Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential (New-Object PSCredential ($adminUsername, (ConvertTo-SecureString $adminPassword -AsPlainText -Force))) |
  Set-AzVMSourceImage -PublisherName $imagePublisher -Offer $imageOffer -Skus $imageSku -Version "latest" |
  Add-AzVMNetworkInterface -Id $nic.Id

# Create the virtual machine
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vmConfig