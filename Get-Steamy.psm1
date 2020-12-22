# Get-Steamy v0.1
# PowerShell Module to run API calls from Steam Web API
# **** Must have an API key of your own to run API calls ****
# Get an API Key here: steamcommunity.com/dev/apikey
# 2020 @tanktopLogger - tanktopsecurity.com - github.com/tanktopSecurity

function Get-SteamUserID ($username, $key) {

    $vanityURL = $userName
    $responseVanityURL = Invoke-RestMethod -URI "https://api.steampowered.com/ISteamUser/ResolveVanityURL/v1/?key=$key&vanityurl=$vanityURL"
    $steamID = $responseVanityURL.response.steamid
    Write-Output $steamID
}
function Get-SteamVanityURL ($steamID, $key) {

    $playerSummary = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=$key&steamids=$steamid"
    $playerSummaryPersonaName =  $playerSummary.response.players.personaname
    Write-Output $playerSummaryPersonaName
}
function Get-SteamUserGames ($steamID, $key) {

    $getOwnedGames = Invoke-RestMethod -Uri "https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?key=$key&steamid=$steamID&include_appinfo=true"
    $ownedGames = $getOwnedGames.response.games
    Write-Output $ownedGames
}
function Get-SteamLevel ($steamID, $key) {

    $steamLevel = Invoke-RestMethod -Uri "https://api.steampowered.com/IPlayerService/GetSteamLevel/v1/?key=$key&steamid=$steamID"
    $steamLevelPlayer = $steamLevel.response.player_level
    Write-Output $steamLevelPlayer
}
function Get-SteamFriendsList ($steamID, $key) {

    Write-Output "Getting friends list for $vanityURL"
    $friendsList = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamUser/GetFriendList/v1/?key=$key&steamid=$steamID"
    $friendsList.friendslist.friends
    Write-Output $friendsList
}
function Get-SteamBans ($steamID, $key) {

    $playerBans = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamUser/GetPlayerBans/v1/?key=$key&steamids=$steamID"
    $playerBansSummary = $playerBans.players | Select-Object -Property CommunityBanned,VacBanned,NumberOfVACBans,DaysSinceLastBan,NumberOfGameBans,EconomyBan
    Write-Output $playerBansSummary
}
function Get-SteamGroups ($steamID, $key) {

    $userGroupList = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamUser/GetUserGroupList/v1/?key=$key&steamid=$steamID"
    $userGroupListSumamry = $userGroupList.response.groups
    Write-Output "  Player is a member of the following groups:"
    Write-Output $userGroupListSumamry
}
