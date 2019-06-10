local js = require("js")
local document = js.global.document
local dom = {}

local function attributes(node, element)
    for k, v in pairs(element.attributes) do
        if v == false then
            node:removeAttribute(k)
        elseif v == true then
            node:setAttribute(k, "")
        else
            node:setAttribute(k, v)
        end
    end

    for k, v in pairs(node.attributes) do
        if element.attributes[k] == nil then
            node:removeAttribute(k)
        end
    end

    return node
end

function dom.renderElement(element)
    if type(element) == "string" or type(element) == "number" then
        return document:createTextNode(element)
    else
        return dom.renderTag(element)
    end
end

function dom.renderTag(element)
    local node = document:createElement(element.name)
    attributes(node, element)

    for _, child in ipairs(element.children) do
        node:appendChild(dom.renderElement(child))
    end

    return node
end

function dom.reconciliate(node, element)
    if type(element) == "table" and element.name == node.nodeName:lower() then
        attributes(node, element)
        dom.reconciliateAll(node, element.children)
        return node
    else
        return node:replaceWith(dom.renderElement(element))
    end
end

function dom.reconciliateAll(node, elements)
    local nodes = node.childNodes

    for i, child in ipairs(elements) do
        if nodes[i - 1] == nil then
            node:appendChild(dom.renderElement(child))
        else
            dom.reconciliate(nodes[i - 1], child)
        end
    end

    for i = #nodes - 1, 0, -1 do
        if elements[i + 1] == nil then
            nodes[i]:remove()
        end
    end
    
    return nodes
end

return dom