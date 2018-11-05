const saved = require('../saved.json') // at this point the file should not have been modified

function font(fontScheme) {
    function getFontName(i) {
        i = i.split(" ")
        i.pop()
        if (i.indexOf(" ") > -1) {
            i = `'${i}'`
        }
        return i
    }
    font = require(`${process.env.ADRYDDOTFILES}/themer/themes/iterm2/fonts/${fontScheme}.json`)
    fontSize = font.normalFont.split(" ").pop()
    normalFont = getFontName(font.normalFont)

    if (font.useNonAsciiFont) {
        nonAsciiFont = getFontName(font.nonAsciiFont)
    } else {
        nonAsciiFont = 'monospace'
    }

    vscode = {}
    vscode["editor.fontFamily"] = `${normalFont}, ${nonAsciiFont}, monospace`
    vscode["editor.fontSize"] = parseInt(fontSize)

    return {
        vscode: vscode,
        iterm: font
    }
}

module.exports = font