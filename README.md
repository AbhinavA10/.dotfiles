# .dotfiles
My config dotfiles for Ubuntu

## Included Scripts

The following scripts are included in `./scripts/`

|          File         |                                Purpose                               |
| :-------------------: | :------------------------------------------------------------------: |
|      `deploy.sh`      |                        calls all other scripts                       |
|      `install.sh`     | Install useful items by default e.g. git, g++, CPU temp sensor, etc. |
|   `link_dotfiles.sh`  |   Create symlinks of dotfiles from `~/` to files in `~/.dotfiles/`   |
| `optional_install.sh` |              Install optional items based on user input              |
|    `set_themes.sh`    |                         Load terminal themes                         |

## Installer

To install useful apps/tools etc, 

- clone this repo into `~/`
- then run:
```bash
cd .dotfiles/scripts
./deploy.sh
```

Also see [./notes/Ubuntu-install.md](./notes/Ubuntu-install.md) for some manual setup steps needed

TODO: make script to fix anaconda tinkter fonts
