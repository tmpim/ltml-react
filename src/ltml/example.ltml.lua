return function()
    return {
        head {
            title "LTML Example"
        },
        body {
            h1 "LTML Example",
            p { test = "asdf", data.message },
            br,
            img { src = data.img },
            input { id = "box", type = "text", onkeydown = "input(this)", value = data.message }
        }
    }
end