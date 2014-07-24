vimfiles
========

My personal Vim configuration files.

Installation
------------
To use these configuration files with a new installation of Vim, simply follow these steps:

# For Windows

1. Navigate to the Vim directory in your Program Files.
2. Delete the \_vimrc file.
3. Make sure your HOME environment variable is set to your desired home directory.
4. Clone this repository in your home directory specified by the HOME environment variable.

# For Linux

1. Navigate to /usr/share/vim.
2. Delete all shortcuts. This includes the vimfiles folder, vimrc, vimrc.tiny, and any others.
3. (Optional) Navigate to /etc/vim. Delete the same files for which you just deleted shortcuts.
4. Make sure your HOME environment variable is set to your desired home directory.
5. Clone this repository in your home directory specified by the HOME environment variable.
6. Renamed the root directory from "vimfiles" to ".vim" so the configuration will be loaded.

# For all platforms
* Remember to initialize and update all submodules located in the bundle directory.

Then run Vim, and start programming!
