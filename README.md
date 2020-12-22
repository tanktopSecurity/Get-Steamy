# Get-Steamy

Get-Steamy is a PowerShell module that aims to make querying the Steam Web API more accessible for PowerShell users. Each function is essentially a wrapper for an API call, with variable substitutions for the API Key, Steam username, steamID. Each function requires the steamID and key parameters. Each function filters the result via dot-notation and uses Write-Output to both disply and make avaiable the result of the API call for assiging to variables. 

1. Get a Steam Web API Key from here: https://steamcommunity.com/dev/apikey

2. Import the module (may need to set PowerShell Execution Policy to unrestricted)
![1](https://user-images.githubusercontent.com/53626698/102906542-0356b600-4432-11eb-8c65-dcc435c189c5.png)

3. Set a variable $key with your API key
![2](https://user-images.githubusercontent.com/53626698/102909357-179cb200-4436-11eb-8f87-77b7f343324a.png)

4. Using the first function Get-SteamUserID, Resolve the steamID of the player your searching for
![3](https://user-images.githubusercontent.com/53626698/102909401-27b49180-4436-11eb-9b9e-d1c54b9e6211.png)

5. You can now use the steamID as a parameter for other functions/API calls
![4](https://user-images.githubusercontent.com/53626698/102906633-22554800-4432-11eb-9d1c-6c4e05e6982a.png)

