module.exports = {
    inject: (colors, constants) => {
        /*for (color in constants.colorValuesMap) {
            writeEsc(1337, `SetColors=${constants.colorValuesMap[color]}=${colors[color].hex}`)
        }*/ //disabled as a temporary fix for https://github.com/Adryd/dotfiles/issues/1
        if (colors['Background Color']) {
            // Not working in macos 10.13, will work in 10.14
            writeEsc("6;1;bg;red;brightness", `${colors['Background Color'].r}`)
            writeEsc("6;1;bg;green;brightness", `${colors['Background Color'].g}`)
            writeEsc("6;1;bg;blue;brightness", `${colors['Background Color'].b}`)
        }
    }
}

function writeEsc(type, data) {
    if (process.env.ISTMUX !== "1") {
        process.stdout.write(`\x1b]${type};${data}\x07`)
    } else {
        process.stdout.write(`\x1bPtmux;\x1b\x1b\x1b]${type};${data}\x07\x1b\\`)
    }
}
