--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

server_scripts {
  -- Core
  "src/database.server.lua",
  -- MySQL libs
  "src/GHMattiMySQL.server.lua",
  "src/BrouznoufMySQL.server.lua",
}

server_exports {
    "QueryExecute",
    "QueryFetchAll",
    "QueryFetch",
    "QueryExecuteAsync",
    "QueryFetchAllAsync",
    "QueryFetchAsync",
}
