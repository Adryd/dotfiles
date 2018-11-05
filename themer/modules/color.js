const saved = require('../saved.json') // at this point the file should not have been modified

function color(colorScheme) {
    let colorMatching = require("./colorMatching.json")
    console.log(colorScheme)

    let pass = false
    for (i of Object.entries(colorMatching)) {
        if (i[0] == colorScheme) {
            pass = true // check if colorscheme exists and if there is a vscode equiveland
            break;
        }
    }
    if (pass != true) {
        console.log("colorscheme undefined, using default")
        colorScheme = saved.default.color
    }

    let convertedColors = {} // Save time and messes later
    const colorSchemeArr = require(`${process.env.ADRYDDOTFILES}/themer/themes/iterm2/colors/${colorScheme}.json`)
    for (i in colorSchemeArr) {
        var rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(colorSchemeArr[i]);
        convertedColors[i] = {}
        convertedColors[i].r = parseInt(rgb[1], 16)
        convertedColors[i].g = parseInt(rgb[2], 16)
        convertedColors[i].b = parseInt(rgb[3], 16)
        convertedColors[i].hex = colorSchemeArr[i]
    }

    let applyQueue = {}
    applyQueue.iterm = convertedColors // Colors to pass to iTerm
    applyQueue.vscode = colorMatching[colorScheme] // Set color theme for vscode

    return applyQueue
}

module.exports = color