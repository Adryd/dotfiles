const fs = require('fs')
const os = require('os')
const path = require('path')

module.exports = {
    generate: generate
}

function generate(colors, fonts, constants) {
    var newConfig = require("./config-template.json");

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

