{ lib, pkgs, ... }:
let
  inherit (lib) getExe;
  launcher = "shift + cmd";
  terminal = getExe pkgs.kitty;
in
{
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig =
      ''
                ${launcher} - k : ${terminal} --single-instance -d ~
                ${launcher} - b : /Applications/Firefox.app
                ${launcher} - s : /Applications/Spotify.app

        	alt - 1 : yabai -m space --focus 1
        	alt - 2 : yabai -m space --focus 2
        	alt - 3 : yabai -m space --focus 3
        	alt - 4 : yabai -m space --focus 4
        	alt - 5 : yabai -m space --focus 5
        	alt - 6 : yabai -m space --focus 6
        	alt - 7 : yabai -m space --focus 7
        	alt - 8 : yabai -m space --focus 8
        	alt - 9 : yabai -m space --focus 9

                	# focus window
                alt - h : yabai -m window --focus west
                alt - j : yabai -m window --focus south
                alt - k : yabai -m window --focus north
                alt - l : yabai -m window --focus east

                # swap managed window
                shift + alt - h : yabai -m window --swap west
                shift + alt - j : yabai -m window --swap south
                shift + alt - k : yabai -m window --swap north
                shift + alt - l : yabai -m window --swap east

                # move managed window
                shift + alt + ctrl - h : yabai -m window --warp west
                shift + alt + ctrl - j : yabai -m window --warp south
                shift + alt + ctrl - k : yabai -m window --warp north
                shift + alt + ctrl - l : yabai -m window --warp east

                # rotate tree
                alt - r : yabai -m space --rotate 90

                # toggle window fullscreen zoom
                alt - f : yabai -m window --toggle zoom-fullscreen; sketchybar --trigger window_focus

                # alt - s : yabai -m window --toggle 
                alt - s : yabai -m window --toggle sticky;\
                	  yabai -m window --toggle topmost;\
                	  yabai -m window --toggle pip

                # toggle padding and gap
                alt - d : yabai -m space --toggle padding; yabai -m space --toggle gap

                # float / unfloat window and center on screen
                alt - t : yabai -m window --toggle float;\
                	  yabai -m window --grid 4:4:1:1:2:2; sketchybar --trigger window_focus

                # toggle window split type
                alt - e : yabai -m window --toggle split

                # balance size of windows
                shift + alt - 0 : yabai -m space --balance

                # move window and focus desktop
                shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1;sketchybar --trigger windows_on_spaces
                shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2;sketchybar --trigger windows_on_spaces
                shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3;sketchybar --trigger windows_on_spaces
                shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4;sketchybar --trigger windows_on_spaces
                shift + alt - 5 : yabai -m window --space 5; yabai -m space --focus 5;sketchybar --trigger windows_on_spaces


                # fast focus desktop
                alt - tab : yabai -m space --focus recent

                shift + lalt - 1 : yabai -m window --space 1 && sketchybar --trigger windows_on_spaces
      '';
  };
}
