# .dotfiles
My config dotfiles for Ubuntu

## Included Scripts

The following scripts are included in `./scripts/`

|          File         |                                Purpose                               |
| :-------------------: | :------------------------------------------------------------------: |
|      `deploy.sh`      |         Deploys these dotfiles by calling all other scripts.         |
|      `install.sh`     | Install useful items by default e.g. git, g++, CPU temp sensor, etc. |
| `optional_install.sh` |              Install optional items based on user input              |
|    `set_themes.sh`    |                         Load terminal themes                         |
|   `link_dotfiles.sh`  |   Create symlinks of dotfiles from `~/` to files in `~/.dotfiles/`   |

## Using these .dotfiles:

```bash
git clone git@github.com:AbhinavA10/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/scripts
./deploy.sh
```

Also see [./notes/Ubuntu-install.md](./notes/Ubuntu-install.md) for some manual setup steps needed


Instead of using a /bin/ repo, can add .dotfiles/bin/ to path using https://github.com/camspiers/dotfiles/blob/master/files/.bashrc#L51-L69 