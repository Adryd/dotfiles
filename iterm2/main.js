const fs = require('fs')
const path = require('path')
const constants = {
    fontRegex: /FONT="(\w+)";/g,
    colorRegex: /COLORS="(\w+)";/g,
    prefsRegex: /PREFS="(\w+)";/g,
    colorValuesMap: ["black", "red", "green", "yellow", "blue", "magenta", "cyan", "white", "br_black", "br_red", "br_green", "br_yellow", "br_blue", "br_magenta", "br_cyan", "br_white"],
    colorMetaValuesMap: ["bg", "fg", "link", "curbg", "curfg", "selbg", "selfg"]
}


fs.readFile(path.join(process.env.ADRYDDOTFILES, 'theme_settings.zsh'), 'utf8', function (err, data) {
    let fontScheme = constants.fontRegex.exec(data)[1]
    let colorScheme = constants.colorRegex.exec(data)[1]
    let selectedPrefs = constants.prefsRegex.exec(data)[1]

    let fontSchemes = require("./presets/fonts.json")
    let colorSchemes = require("./presets/colors.json")
    let prefs = require("./presets/prefs.json")

    let convertedColors = {} // Save time and messes later
    let selectedColorScheme = colorSchemes[colorScheme]
    for (color in selectedColorScheme) {
        var rgb = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(selectedColorScheme[color]);
        convertedColors[color] = {}
        convertedColors[color].r = parseInt(rgb[1], 16)
        convertedColors[color].g = parseInt(rgb[2], 16)
        convertedColors[color].b = parseInt(rgb[3], 16)
        convertedColors[color].hex = selectedColorScheme[color]
    }

    require("./config.js").generate(convertedColors, fontSchemes[fontScheme], prefs[selectedPrefs], constants)
    require("./inject.js").inject(convertedColors, constants)
})