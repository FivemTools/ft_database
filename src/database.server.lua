--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local lib = GetConvar("ft_database_lib", "false")
libs = {}

--
--
--
local function SafeParameters(params)

    if nil == params then
        return {['1'] = 1}
    end

    assert(type(params) == "table", "EROOR on ft_database : A table is expected")
    assert(params[1] == nil, "EROOR on ft_database : Parameters should not be an array, but a map (key / value pair) instead")

    if next(params) == nil then
        return {['1'] = 1}
    end

    return params

end

--
--
--
local function SafeCallback(callback)

    if callback == nil then
        return function() end
    end

    assert(type(callback) == "table", "EROOR on ft_database : A callback is expected")

    return callback

end

--
--
--
function QueryExecute(query, parameters)

    assert(type(query) == "string", "EROOR on ft_database : The SQL Query must be a string")
    parameters = SafeParameters(parameters)
    return libs[lib].Sync.execute(query, parameters)

end

--
--
--
function QueryFetchAll(query, parameters)

    assert(type(query) == "string", "EROOR on ft_database : The SQL Query must be a string")
    parameters = SafeParameters(parameters)
    return libs[lib].Sync.fetchAll(query, parameters)

end

--
--
--
function QueryFetch(query, parameters)

    assert(type(query) == "string", "EROOR on ft_database : The SQL Query must be a string")
    parameters = SafeParameters(parameters)
    return libs[lib].Sync.fetch(query, parameters)

end

--
--
--
function QueryExecuteAsync(query, parameters, callback)

    assert(type(query) == "string", "EROOR on ft_database :The SQL Query must be a string")
    parameters = SafeParameters(parameters)
    callback = SafeCallback(callback)
    libs[lib].Async.execute(query, parameters, callback)

end

--
--
--
function QueryFetchAllAsync(query, parameters, callback)

    assert(type(query) == "string", "EROOR on ft_database : The SQL Query must be a string")
    parameters = SafeParameters(parameters)
    callback = SafeCallback(callback)
    libs[lib].Async.fetchAll(query, parameters, callback)

end

--
--
--
function QueryFetchAsync(query, parameters, callback)

    assert(type(query) == "string", "EROOR on ft_database : The SQL Query must be a string")
    parameters = SafeParameters(parameters)
    callback = SafeCallback(callback)
    libs[lib].Async.fetchScalar(query, parameters, callback)

end

--
--
--
RegisterServerEvent("ft_database:OnReady")
AddEventHandler('ft_database:OnReady', function(callback)

    libs[lib].ready(callback)

end)

--
--
--
AddEventHandler('onServerResourceStart', function(resource)

    if resource == 'ft_database' then
        if lib ~= "false" and libs[lib] then
            TriggerEvent("ft_database:IsStarted")
        else
            print("[FT_DABASE] ft_database_lib not define or lib not exist, add 'ft_database_lib' on server.cfg")
        end
    end

end)
