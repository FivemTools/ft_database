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
        return
    end
    AddEventHandler("GHMattiMySQLStarted", callback)
end

--
--
--
libs.GHMattiMySQL = MySQL
