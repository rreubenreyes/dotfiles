# dotfiles

This installs most of the stuff I use on a macOS machine day-to-day. If I missed something, I either forgot and will add it here later, or it's so niche that I probably didn't need to install it anyway.

## what

* Code editor
* Preferred terminal program
* Stuff to browse the internet with
* Most programs I use regularly (`jq` and whatnot)

## how

Install everything:

```bash
sudo ./install.sh
```

Install just some stuff (see comments in `install.sh`):

```bash
./install.sh --step <step_number> [, --step <step_number> [, ...etc.]]
```

## is this a work machine?

Go look at the Brewfile and uncomment stuff
