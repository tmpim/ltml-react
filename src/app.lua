local js = require("js")
local document = js.global.document
local ltml = require("./src/ltml/ltml.lua")
local dom = require("./src/ltml/dom.lua")
local utils = require("./src/ltml/utils.lua")
local template = require("./src/ltml/example.ltml.lua")

local data = {
    message = "It works!",
    img = "http://www.lua.org/manual/5.3/logo.gif"
}

function doRender()
    local htmlTree = ltml.execute(template, { data = data })
    dom.reconciliateAll(document.documentElement, htmlTree)
end

function js.global.input(_, e)
    data.message = e.value
    doRender()
end

doRender()