--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
--
--
function QueryExecute(query, parameters)

    return exports:ft_database:QueryExecute(query, parameters)

end

--
--
--
function QueryFetchAll(query, parameters)

    return exports:ft_database:QueryFetchAll(query, parameters)

end

--
--
--
function QueryFetch(query, parameters)

    return exports:ft_database:QueryFetch(query, parameters)

end

--
--
--
function QueryExecuteAsync(query, parameters, callback)

    exports:ft_database:QueryExecuteAsync(query, parameters, callback)

end

--
--
--
function QueryFetchAllAsync(query, parameters, callback)

    exports:ft_database:QueryFetchAllAsync(query, parameters, callback)

end

--
--
--
function QueryFetchAsync(query, parameters, callback)

    exports:ft_database:QueryFetchAsync(query, parameters, callback)

end
