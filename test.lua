--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

RegisterServerEvent("ft_database:OnReady")
AddEventHandler('ft_database:OnReady', function()
	local user = QueryFetchAll("SELECT * FROM users", {})
	TriggerEvent("ft_libs:PrintTable", user)
end)