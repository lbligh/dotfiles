#!/usr/bin/env zsh

# Check if Homebrew's bin exists and if it's not already in the PATH
if [ -x "/opt/homebrew/bin/brew" ] && [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Install VS Code Extensions
extensions=(
    almahdi.code-django
    charliermarsh.ruff
    cschlosser.doxdocgen
    docker.docker
    eamodio.gitlens
    esbenp.prettier-vscode
    foxundermoon.shell-format
    github.vscode-pull-request-github
    hossaini.bootstrap-intellisense
    james-yu.latex-workshop
    jeff-hykin.better-cpp-syntax
    jgclark.vscode-todo-highlight
    marus25.cortex-debug
    mcu-debug.debug-tracker-vscode
    mcu-debug.memory-view
    mcu-debug.peripheral-viewer
    mcu-debug.rtos-views
    mechatroner.rainbow-csv
    monosans.djlint
    ms-azuretools.vscode-containers
    ms-azuretools.vscode-docker
    ms-python.debugpy
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
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.cmake-tools
    ms-vscode.cpp-devtools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    ms-vscode.cpptools-themes
    ms-vscode.makefile-tools
    ms-vscode.remote-explorer
    ms-vscode.vscode-serial-monitor
    natizyskunk.sftp
    njpwerner.autodocstring
    otovo-oss.htmx-tags
    paulober.pico-w-go
    raspberry-pi.raspberry-pi-pico
    redhat.vscode-xml
    tamasfe.even-better-toml
    tecosaur.latex-utilities
    thinker.sort-json
    yzhang.markdown-all-in-one
)

# Get a list of all currently installed extensions.
installed_extensions=$(code --list-extensions)

for extension in "${extensions[@]}"; do
    if echo "$installed_extensions" | grep -qi "^$extension$"; then
        echo "$extension is already installed. Skipping..."
    else
        echo "Installing $extension..."
        code --install-extension "$extension"
    fi
done

echo "VS Code extensions have been installed."

# Define the target directory for VS Code user settings on macOS
VSCODE_USER_SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"

# Check if VS Code settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Copy your custom settings.json and keybindings.json to the VS Code settings directory
    ln -sf "${HOME}/dotfiles/settings/VSCode-Settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"
    ln -sf "${HOME}/dotfiles/settings/VSCode-Keybindings.json" "${VSCODE_USER_SETTINGS_DIR}/keybindings.json"

    echo "VS Code settings and keybindings have been updated."
else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi

# Open VS Code to sign-in to extensions
code .
echo "Login to extensions (Copilot, Grammarly, etc) within VS Code."
echo "Press enter to continue..."
read
