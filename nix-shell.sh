#!/bin/sh
nix-shell -p pkgs.{pandoc,gnumake,entr} 'pkgs.python3.withPackages (pkgs: with pkgs; [pandocfilters pyphen])'
