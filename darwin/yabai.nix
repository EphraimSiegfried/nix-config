# NOTE: Only works if SIP disabled
{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config =
      {
        focus_follows_mouse = "autoraise";
        mouse_follows_focus = "off";
        window_placement = "second_child";
        window_opacity = "off";
        window_opacity_duration = "0.0";
        window_border = "on";
        window_border_placement = "inset";
        window_border_width = 2;
        window_border_radius = 3;
        active_window_border_topmost = "off";
        window_topmost = "on";
        window_shadow = "float";
        active_window_opacity = "1.0";
        normal_window_opacity = "1.0";
        split_ratio = "0.50";
        auto_balance = "on";
        mouse_modifier = "fn";
        mouse_action1 = "move";
        mouse_action2 = "resize";
        layout = "bsp";
        top_padding = 36;
        bottom_padding = 10;
        left_padding = 10;
        right_padding = 10;
        window_gap = 10;
      };
    extraConfig =
      ''
        	yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
        	sudo yabai --load-sa
        
                yabai -m rule --add app="^System Settings$" manage=off
                yabai -m rule --add app="^System Information$" manage=off
                yabai -m rule --add app="^Archive Utility$" manage=off
                yabai -m rule --add app="DeepL" manage=off
                yabai -m rule --add app="ColorSlurp" manage=off
      '';
  };
}
