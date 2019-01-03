#!/bin/sh
nix-shell -p pkgs.{gnumake,entr} 'pkgs.python3.withPackages (pkgs: with pkgs; [pandocfilters pyphen])'
