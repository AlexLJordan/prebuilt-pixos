## Prebuilt PixOS (NixOS on Pi)
This Project's aim is to provide a way to `nix-build` a simple, ready-to-boot image (not installer!) for my raspberrypi 3B and maybe yours too.
This is accomplished via cross-compilation for aarch64.
I might include a way to make the sd-card read-only, via predefining a USB harddrive for a mutable filesystem. This should decrease the wear-and-tear of the sd-card.
I might also include a way to easily cross-compile your own configuration as well as the basic starting point so you don't have to wait for your pi to do the full `nix-rebuild swith`, because that takes ages depending on what you want to install.

#### The rest is just some shit i wrote down

This shall enable me to build an SD-Image to burn directly onto a rpi and use it read-only if possible.

goals are:
* not building an installation device
* creating an .img file
* provide all packages needed
* mount root as readonly
* make image small (if at all possible)
* be able to boot from this image directly
* have sshd enabled with my credentials
    - have a secrets file invisible to github?
* use cache.nixos.org as much as possible
* maybe use 18.09 for less bugs when cross-compiling?
* include all firmware for wifi!

I don't fucking know...
I just had enough of this shit. Installers all sucked.
The official one doesnt work for me since it disables sshd.
The first one i've built is just plain weird (but it built at least).
  It wasn't able to install because some bullshit was wrong (resolv.conf was wrong, no channel defined for pulling cached stuff, stuttering and being overloaded with crap when rebuilding)
fucking hell.

all the other times i've tried to fix the cross compiler for working with upstream nixpkgs.
god fucking damn it.
im so frustrated with this shit.
Right now the cross compiler hangs because perl decided it has to execute its binary to check something, BUT WAIT! This is the wrong architecture because im FUCKING CROSS COMPILING so this just fails as the binary format is (naturally) wrong.

don't get me started about how disabling building the manual/documentation doesnt do exactly this if you don't scream at the settings for 2 hours.
fuck.

### Anyway...
