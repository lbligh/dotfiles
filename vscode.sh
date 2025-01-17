#!/usr/bin/env bash

# Install VSCode Setup and Extensions Packages
echo "Installing VSCode Extentions"


extensions=(
charliermarsh.ruff
cschlosser.doxdocgen
eamodio.gitlens
eirikpre.systemverilog
esbenp.prettier-vscode
James-Yu.latex-workshop
jeff-hykin.better-cpp-syntax
MathWorks.language-matlab
ms-azuretools.vscode-docker
ms-python.black-formatter
ms-python.isort
ms-python.pylint
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-slideshow
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-wsl
ms-vscode.cmake-tools
ms-vscode.cpptools
ms-vscode.cpptools-extension-pack
ms-vscode.cpptools-themes
ms-vscode.makefile-tools
ms-vscode.remote-explorer
ms-vscode.vscode-serial-monitor
mshr-h.veriloghdl
nickfode.latex-formatter
platformio.platformio-ide
puorc.awesome-vhdl
redhat.java
rjyoung.vscode-modern-vhdl-support
scydact.pic-assembly
tecosaur.latex-utilities
twxs.cmake
Vinrobot.vhdl-formatter
VisualStudioExptTeam.intellicode-api-usage-examples
VisualStudioExptTeam.vscodeintellicode
vsciot-vscode.vscode-arduino
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
)


while read p; do
  code --install-extension "$p"
done <settings/extensions

cp settings/VSCode-settings.json "/Users/lzb/Library/Application Support/Code/User/"
mv /Users/lzb/Library/Application\ Support/Code/User/VSCode-settings.json /Users/lzb/Library/Application\ Support/Code/User/settings.json

cp settings/VSCode-Keybindings.json "/Users/lzb/Library/Application Support/Code/User/"
mv /Users/lzb/Library/Application\ Support/Code/User/VSCode-Keybindings.json /Users/lzb/Library/Application\ Support/Code/User/keybindings.json
