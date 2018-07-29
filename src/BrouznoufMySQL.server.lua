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
    return exports['mysql-async']:mysql_sync_execute(query, parameters)
end

--
--
--
function MySQL.Sync.fetchAll(query, parameters)
    return exports['mysql-async']:mysql_sync_fetch_all(query, parameters)
end

--
--
--
function MySQL.Sync.fetch(query, parameters)
    if not string.find(query, "LIMIT") and not string.find(query, "limit") then
        query = query .. " LIMIT 1"
    end
    return exports['mysql-async']:mysql_sync_fetch_all(query, parameters)[1]
end

--
--
--
function MySQL.Sync.scalar(query, parameters)
    return exports['mysql-async']:mysql_sync_fetch_scalar(query, parameters)[1]
end


--
--
--
function MySQL.Async.execute(query, parameters, callback)
    exports['mysql-async']:mysql_execute(query, parameters, callback)
end

--
--
--
function MySQL.Async.fetchAll(query, parameters, callback)
    exports['mysql-async']:mysql_fetch_all(query, parameters, callback)
end

--
--
--
function MySQL.Async.fetch(query, parameters, callback)
    if not string.find(query, "LIMIT") and not string.find(query, "limit") then
        query = query .. " LIMIT 1"
    end
    exports['mysql-async']:mysql_fetch_all(query, parameters, function(result)
        callback(result[1])
    end)
end

--
--
--
function MySQL.Async.scalar(query, parameters, callback)
    exports['mysql-async']:mysql_fetch_scalar(query, parameters, callback)
end

--
--
--
local isReady = false
AddEventHandler('onMySQLReady', function ()
    isReady = true
end)

function MySQL.ready(callback)

    if isReady then
        callback()
    else
        AddEventHandler('onMySQLReady', callback)
    end    

end

--
--
--
libs.BrouznoufMySQL = MySQL