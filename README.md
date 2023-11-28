# gesture-shortcuts
A set of KDE commands for gestures

## Usage

- Install [`gesture-manager-git`](https://aur.archlinux.org/packages/gesture-manager-git)
- Add the user to `input` group: `sudo usermod -a -G input ${USER}`
- Copy the script to home directory
- Create a symlink: `sudo ln -s ~/gesture-shortcuts.sh /usr/bin/gesture-shortcuts`
- Run `gesture-manager` in terminal
- Set the gestures `gesture-shortcuts <command>`

## Example

Content of `~/.config/libinput-gestures.conf`:

  ```
  swipe up         3 gesture-shortcuts desktopshow
  swipe down       3 gesture-shortcuts exposeall
  swipe left       3 gesture-shortcuts nextdesktop
  swipe right      3 gesture-shortcuts previousdesktop
  ```
