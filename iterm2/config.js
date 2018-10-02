
const fs = require('fs')
const os = require('os')
const path = require('path')

module.exports = {
    generate: generate
}

function generate(colors, fonts, prefs, constants) {
    let newConfig = require("./profiles/default.json")    
    let baseConfig = require("./profiles/configBase.json")
    let keybinds = require("./profiles/keybinds.json")

    for (pref in baseConfig) {
        newConfig[pref] = baseConfig[pref]
    }

    delete newConfig["Keyboard Map"]
    newConfig["Keyboard Map"] = keybinds["Keyboard Map"]

    // Push fonts to config
    newConfig["Horizontal Spacing"] = fonts.horizontalSpacing
    newConfig["Vertical Spacing"] = fonts.verticalSpacing
    newConfig["Normal Font"] = fonts.normalFont
    newConfig["Non Ascii Font"] = fonts.nonAsciiFont
    newConfig["Use Non-ASCII Font"] = fonts.useNonAsciiFont


    for (i in colors) { 
        // This will create useless values but it doesn't matter, we can ignore them, dealing with them would take too much time
        newConfig[i] = {
            'Red Component': colors[i].r / 255,
            'Green Component': colors[i].g / 255,
            'Blue Component': colors[i].b / 255,
            'Color Space': 'sRGB'
        }
    }
    
    for (let i = 0; i <= 15; i++) {
        newConfig["Ansi " + i + " Color"] = {
            'Red Component': colors[i].r / 255,
            'Green Component': colors[i].g / 255,
            'Blue Component': colors[i].b / 255
        }
    }

    for (pref in prefs) {
        newConfig[pref] = prefs[pref]
    }

   // To be written to file
    let w2f = {
        "Profiles": [newConfig]
    }

    // Write to it2 dynamic config file
    fs.writeFile(path.join(os.homedir(), 'Library', 'Application Support', 'iTerm2', 'DynamicProfiles', 'Adryd'), JSON.stringify(w2f), function (err) {
        if (err) {
            return console.log(err);
        }
    });
}
