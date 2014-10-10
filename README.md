vimfiles
========

My personal Vim configuration files.

Installation
------------
To use these configuration files with a new installation of Vim, simply follow these steps:

### For Windows

1. Navigate to the Vim directory in your Program Files.
2. Delete the \_vimrc file.
3. Make sure your HOME environment variable is set to your desired home directory.
4. Clone this repository in your home directory specified by the HOME environment variable.
5. Remember to initialize and update all submodules located in the bundle directory.

### For Linux

1. Navigate to /usr/share/vim.
2. Delete all shortcuts. This includes the vimfiles folder, vimrc, vimrc.tiny, and any others.
3. (Optional) Navigate to /etc/vim. Delete the same files for which you just deleted shortcuts.
4. Make sure your HOME environment variable is set to your desired home directory.

    cd ~/
    git clone git@gist.github.com:/0bf63d489336c9b5fd52.git
    cd 0bf63d489336c9b5fd52
    chmod +x install-vimfiles
    ./install-vimfiles
    cd ~/
    rm -rf 0bf63d489336c9b5fd52
