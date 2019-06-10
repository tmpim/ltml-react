local js = require("js")
local object
function object(obj)
    if type(obj) == "table" then
        local new = js.new(js.global.Object)

        for k, v in pairs(obj) do
            if type(k) == "string" then
                new[k] = object(v)
            end
        end

        return new
    else
        return obj
    end
end
return object