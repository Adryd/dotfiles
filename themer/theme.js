const fs = require('fs')
const os = require('os')
const path = require('path')

const color = require('./modules/color.js')
const font = require('./modules/font.js')

let vscode = require(path.join(os.homedir(), 'Library', 'Application Support', 'Code', 'User', 'settings.json'))
const iterm2 = require('./iterm.js')

function asd (values) {
    let applyQueue = {}
    
    if (values.color) {
        let colorValues = color(values.color)
        vscode["workbench.colorTheme"] = colorValues.vscode
        applyQueue.color = colorValues.iterm
    }
    if (values.font) {
        let fontValues = font(values.font)
        for (i of Object.entries(fontValues.vscode)) {
            vscode[i[0]] = i[1]
        }
        applyQueue.font = fontValues.iterm
    }
    if (values.prompt) {
        prompt(values.prompt)
    }

    iterm2.generate(applyQueue.color, applyQueue.font)
    return 0;
}


module.exports = asd