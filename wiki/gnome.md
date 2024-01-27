# Gnome

## Top bar

### Change font weight

- Install gresource command: `sudo dnf install glib2-devel`
- `gresource extract /usr/share/gnome-shell/gnome-shell-theme.gresource /org/gnome/shell/theme/gnome-shell.css > ~/.themes/custom/gnome-shell/gnome-shell.css`
- Change `font-weight` property for `#panel` selector.
