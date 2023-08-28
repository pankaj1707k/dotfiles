# GRUB boot loader

## Theme

- Clone repo: [vinceliuice/grub2-themes](https://github.com/vinceliuice/grub2-themes)
- Make sure current user has write access to `/boot/grub` or `/boot/grub2` and create a `themes` directory in it. 
  Login as `root` if not.
- Generate the theme files in `/boot/grub` or `/boot/grub2`: `$ ./install.sh -t stylish -g /boot/grub2/themes/`
- Add/modify the following values in `/etc/default/grub`:
  ```
  GRUB_TERMINAL_OUTPUT="gfxterm"
  GRUB_GFXMODE=1920x1080x32,auto
  GRUB_THEME="/boot/grub2/themes/stylish/theme.txt"
  ```
- Generate grub configuration: `$ grub2-mkconfig -o /boot/grub2/grub.cfg`

*Directly installing the theme using the install script instead of generating the theme files causes the theme files 
to be generated in `/usr/share/grub/themes/` which causes an incorrect resolution and secure boot violation.*
