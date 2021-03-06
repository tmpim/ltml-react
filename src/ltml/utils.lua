local utils = {}

function utils.copy(from, to)
    for k, v in pairs(from) do
        to[k] = v
    end
end

function utils.shallowMerge(a, b)
    local c = {}

    utils.copy(a, c)
    utils.copy(b, c)

    return c
end

function utils.deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[utils.deepCopy(orig_key)] = utils.deepCopy(orig_value)
        end
        setmetatable(copy, utils.deepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function utils.htmlSpecialChars(txt)
    return txt:gsub("&", "&amp;")
              :gsub("<", "&lt;")
              :gsub(">", "&gt;")
              :gsub("\"", "&quot;")
end

function utils.count(tbl)
    local count
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

return utils