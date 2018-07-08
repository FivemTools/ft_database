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
    return exports['mysql-async']:mysql_sync_fetch_scalar(query, parameters)
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
    exports['mysql-async']:mysql_fetch_scalar(query, parameters, callback)
end

--
--
--
local isReady = false
AddEventHandler('onMySQLReady', function ()
    isReady = true
    print("onMySQLReady")
end)

function MySQL.ready(callback)
    if isReady then
        callback()

        return
    end

    AddEventHandler('onMySQLReady', callback)
end

--
--
--
libs.BrouznoufMySQL = MySQL