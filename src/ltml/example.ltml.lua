return function()
    return {
        head {
            title "LTML-react Example"
        },
        body {
            h1 "LTML-react Example",
            p { "This page was created using only Lua (no HTML, JS, CSS). Type in the input to change the text below:", 
                br,
                b { data.message }
            },
            br,
            img { src = data.img },
            br,
            input { id = "box", type = "text", onkeydown = "input(this)", onkeyup = "input(this)", onchange = "input(this)", value = data.message }
        }
    }
end