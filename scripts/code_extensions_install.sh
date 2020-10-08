#!/bin/bash
echo "--- Installing VSCode extensions"

# https://stackoverflow.com/questions/34286515/how-to-install-visual-studio-code-extensions-from-command-line
# https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays

codeExtensions=(
    "byi8220.indented-block-highlighting"
    "ms-python.python"
    "nick-rudenko.back-n-forth"
    "vscode-icons-team.vscode-icons"
)

for ext in ${codeExtensions[@]}; do
   echo "Installing: $ext"
   code --install-extension $ext
done