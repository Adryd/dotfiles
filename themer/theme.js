// TO BE DONE

// Far future features:
//          ability to modify themes for vim and vscode
//          pass background color to tmux to make status line blend in

// APPLY COMMANDS
// apply changes to term
// arguments:
// "--temp" will set the theme back to  after a reload
// "--default" will set the following theme as default, being applied whenever the reset command is run

// COLOR
// Changes iTerm2 dynamic profile with a set of colors defined in a configuration file
// $ artheme color gloom
// $ artheme color vga --temp
// $ artheme color monokai --default 

// FONT
// Changes iTerm2 dynamic profile with a font defined in a configuration file
// $ artheme font monaco
// $ artheme font vga --temp
// $ artheme font pragmatapro --default

// PROMPT
// Changes zsh prompt to one in the themes folder
// $ artheme prompt bash
// $ artheme prompt msdos --temp
// $ artheme prompt powerline --default

// RELOAD
// Applies themes if they were not previously applied, regenerates iTerm2 dynamic profile
// Will reset themes applied with --temp to that applied before it
// $ artheme reload 

// RESET
// Resets themes to those stored in default profile
// $ artheme reload 


const fs = require('fs')
const os = require('os')
const path = require('path')

let vscode = require(path.join(os.homedir(), 'Library', 'Application Support', 'Code', 'User', 'settings.json'))
let saved = require("./saved.json")
let applied = {}

function apply() {
    function getSaves(varName) {
        let out
        if (saved.temp[varName]) {
            console.log(1)
            out = saved.temp[varName]
        } else if (saved.current[varName]) {
            console.log(2)
            out = saved.current[varName]
        } else if (saved.default[varName]) {
            console.log(3)
            out = saved.default[varName]
        }
        return out
    }
    //prompt(saved.current.prompt, 1)
    //statusline(saved.current.statusline, 1)

    applied.color = color(getSaves("color"), 3)
    applied.font = font(getSaves("font"), 3)
}




function color(colorScheme, storage) {
    let colorMatching = require("./colorMatching.json")
    console.log(colorScheme)

    let pass = false
    for (i of Object.entries(colorMatching)) {
        if (i[0] == colorScheme) {
            pass = true
            break;
        }
    }
    if (pass != true) {
        console.log("colorscheme undefined, using default")
        colorScheme = saved.default.color
    }

    vscode["workbench.colorTheme"] = colorMatching[colorScheme]

    let convertedColors = {} // Save time and messes later
    const colorSchemeArr = require(`./themes/iterm2/colors/${colorScheme}.json`)
    for (i in colorSchemeArr) {
        var rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(colorSchemeArr[i]);
        convertedColors[i] = {}
        convertedColors[i].r = parseInt(rgb[1], 16)
        convertedColors[i].g = parseInt(rgb[2], 16)
        convertedColors[i].b = parseInt(rgb[3], 16)
        convertedColors[i].hex = colorSchemeArr[i]
    }

    if (storage != 3)  {
        let a = ["current", "temp", "default"][storage]
        saved[a].color = colorScheme
        saved.temp.color = colorScheme
    }
    return convertedColors
}

function font(font, storage) {

    function getFontName(i) {
        i = i.split(" ")
        i.pop()
        if (i.indexOf(" ") > -1) {
            i = `'${i}'`
        }
        return i
    }
    fontScheme = font
    font = require(`./themes/iterm2/fonts/${font}.json`)
    fontSize = font.normalFont.split(" ").pop()
    normalFont = getFontName(font.normalFont)

    if (font.useNonAsciiFont) {
        nonAsciiFont = getFontName(font.nonAsciiFont)
    } else {
        nonAsciiFont = 'monospace'
    }

    vscode["editor.fontFamily"] = `${normalFont}, ${nonAsciiFont}, monospace`
    vscode["editor.fontSize"] = parseInt(fontSize)

    if (storage != 3)  {
        let a = ["current", "temp", "default"][storage]
        saved[a].font = fontScheme
        saved.temp.font = fontScheme
    }

    return font
}



function write() {
    require("./iterm.js").generate(
        applied.color,
        applied.font
        //iterm2prefs(saved.current.prefs, 1)
    )
    fs.writeFile(path.join(os.homedir(), 'Library', 'Application Support', 'Code', 'User', 'settings.json'), JSON.stringify(vscode), function (err) {
        if (err) {
            return console.log(err);
        }
    });
    fs.writeFile(path.join(process.env.ADRYDDOTFILES, 'themer','saved.json'), JSON.stringify(saved), function (err) {
        if (err) {
            return console.log(err);
        }
    });
}

switch (process.argv[2]) {
    case "color": 
        apply()
        applied.color = color(process.argv[3],0)
        write()
        break;
    case "font": 
        apply()
        applied.font = font(process.argv[3],0)
        write()
        break;
    case "default":
    case "current":
        applied.font = font(saved[process.argv[2]].font,0)
        applied.color = color(saved[process.argv[2]].color,0)
        write()
        break;

}

//apply()

