--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local MySQL = {
    Async = {},
    Sync = {},
	Threaded = {}
}

--
--
--
function MySQL.Sync.execute(query, parameters)
    return exports["GHMattiMySQL"]:Query(query, parameters)
end

--
--
--
function MySQL.Sync.fetchAll(query, parameters)
    return exports["GHMattiMySQL"]:QueryResult(query, parameters)
end

--
--
--
function MySQL.Sync.fetch(query, parameters)
    if not string.find(query, "LIMIT") and not string.find(query, "limit") then
        query = query .. " LIMIT 1"
    end
    return exports["GHMattiMySQL"]:QueryResult(query, parameters)
end

--
--
--
function MySQL.Sync.scalar(query, parameters)
    return exports["GHMattiMySQL"]:QueryScalar(query, parameters)
end

--
--
--
function MySQL.Async.execute(query, parameters, callback)
    exports["GHMattiMySQL"]:QueryAsync(query, parameters, callback)
end

--
--
--
function MySQL.Async.fetchAll(query, parameters, callback)
    exports["GHMattiMySQL"]:QueryResultAsync(query, parameters, callback)
end

--
--
--
function MySQL.Async.fetch(query, parameters, callback)
    if not string.find(query, "LIMIT") and not string.find(query, "limit") then
        query = query .. " LIMIT 1"
    end
    exports["GHMattiMySQL"]:QueryResultAsync(query, parameters, function()
        callback(result[1])
    end)
end

--
--
--
function MySQL.Async.scalar(query, parameters, callback)
    exports["GHMattiMySQL"]:QueryScalarAsync(query, parameters, callback)
end

--
--
--
local isReady = false
AddEventHandler("GHMattiMySQLStarted", function()
    isReady = true
end)

function MySQL.ready(callback)

    if isReady then
        callback()
    else
        AddEventHandler("GHMattiMySQLStarted", callback)
    end    

end

--
--
--
libs.GHMattiMySQL = MySQL
