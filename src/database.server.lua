--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local lib = nil
libs = {}

--
--
--
local function safeParameters(params)
    if nil == params then
        return {['1'] = 1}
    end

    assert(type(params) == "table", "A table is expected")
    assert(params[1] == nil, "Parameters should not be an array, but a map (key / value pair) instead")

    if next(params) == nil then
        return {['1'] = 1}
    end

    return params
end

--
--
--
local function safeCallback(callback)
    if callback == nil then
        return function() end
    end

    assert(type(callback) == "function", "A callback is expected")

    return callback
end

--
--
--
function QueryExecute(query, parameters)
    assert(type(query) == "string", "The SQL Query must be a string")
    parameters = safeParameters(parameters)
    return libs[lib].Sync.execute(query, parameters)
end

--
--
--
function QueryFetchAll(query, parameters)
    assert(type(query) == "string", "The SQL Query must be a string")
    parameters = safeParameters(parameters)
    return libs[lib].Sync.fetchAll(query, parameters)
end

--
--
--
function QueryFetch(query, parameters)
    assert(type(query) == "string", "The SQL Query must be a string")
    parameters = safeParameters(parameters)
    return libs[lib].Sync.fetchScalar(query, parameters)
end

--
--
--
function QueryExecuteAsync(query, parameters, callback)
    assert(type(query) == "string", "The SQL Query must be a string")
    parameters = safeParameters(parameters)
    callback = safeCallback(callback)
    libs[lib].Async.execute(query, parameters, callback)
end

--
--
--
function QueryFetchAllAsync(query, parameters, callback)
    assert(type(query) == "string", "The SQL Query must be a string")
    parameters = safeParameters(parameters)
    callback = safeCallback(callback)
    libs[lib].Async.fetchAll(query, parameters, callback)
end

--
--
--
function QueryFetchAsync(query, parameters, callback)
    assert(type(query) == "string", "The SQL Query must be a string")
    parameters = safeParameters(parameters)
    callback = safeCallback(callback)
    libs[lib].Async.fetchScalar(query, parameters, callback)
end

--
--
--
function QueryReady(callback)
    libs[lib].ready(callback)
end

--
--
--
AddEventHandler('onServerResourceStart', function(resource)
    if resource == 'ft_database' then
        lib = GetConvar("ft_database_lib", "false")
        if lib ~= "false" and libs[lib] then
            TriggerEvent("ft_database:OnReady")
        else
            print("[FT_DABASE] ft_database_lib not define or lib not exist, add 'ft_database_lib' on server.cfg")
        end
    end
end)
