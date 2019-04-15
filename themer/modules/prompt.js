const fs = require("fs")

function prompt(name) {
    let themes = []
    fs.readdir('../themes/zsh/prompts', (err, files) => {
        for (file of files) {
            if (file !== '.DS_Store') {
                themes.push(file.replace('.zsh-theme','').toLowerCase())
                // I'm lazy, gonna do the whole darn thing in a callback because i don't feel like setting up async stuff
            }
        }
        console.log(themes)

        if (themes.indexOf(name.toLowerCase()) > -1) {
            fs.writeFile('../termvar', `source $ADRYDDOTFILES/themer/themes/zsh/prompts/${themes[themes.indexOf(name.toLowerCase())]}.zsh-theme`, () => {})
        }
    });
}
module.exports = prompt
