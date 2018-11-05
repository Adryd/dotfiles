const fs = require('fs')
const os = require('os')
const path = require('path')

let argv = require('minimist')(process.argv.slice(2)); // For parsing arguments
let savedValues = require('./saved.json') // Saved state

let saveState = 0 // 0 = sync, 1 = sync and default, 2 = do not sync

if (argv.save || argv.default) {
    saveState = 1 // will apply theme and set it as default
}
if (argv.temp) {
    saveState = 2 // will apply theme but not sync it 
}

let values = { // set variables if they are set to change according to arguments, if not fall back to current settings
    color: argv.color ? argv.color : savedValues.current.color,
    font: argv.font ? argv.font : savedValues.current.font,
    prompt: argv.prompt ? argv.prompt : savedValues.current.prompt
}

if (argv.restore) {
    values = savedValues.default
}
if (argv.reset || argv.init || argv.reinit || argv.sync) {
    values = savedValues.current
}

switch (saveState) {
    case 0:
        values.current = values // save values
        break
    case 1:
        savedValues.current = values // save values
        savedValues.default = {  // save only modified values
            color: argv.color ? argv.color : savedValues.default.color,
            font: argv.font ? argv.font : savedValues.default.font,
            prompt: argv.prompt ? argv.prompt : savedValues.default.prompt
        }
    case 2:
        break; // make no changes
}

const color = require('./modules/color.js')
const font = require('./modules/font.js')

let vscode = require(path.join(os.homedir(), 'Library', 'Application Support', 'Code', 'User', 'settings.json'))
const iterm2 = require('./iterm.js')

function generate (values) {
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
generate(values)


fs.writeFile(path.join(process.env.ADRYDDOTFILES, 'themer', 'saved.json'), JSON.stringify(savedValues), function (err) {
    if (err) {
        return console.log(err);
    }
});

fs.writeFile(path.join(os.homedir(), 'Library', 'Application Support', 'Code', 'User', 'settings.json'), JSON.stringify(vscode), function (err) {
    if (err) {
        return console.log(err);
    }
});