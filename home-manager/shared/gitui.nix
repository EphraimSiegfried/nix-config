{
  programs.gitui = {
    enable = false;
    # Catpuccin mocha theme https://github.com/catppuccin/gitui/blob/main/themes/catppuccin-macchiato.ron
    theme = ''
      selected_tab: Some("Reset"),
      command_fg: Some("#cad3f5"),
      selection_bg: Some("#5b6078"),
      selection_fg: Some("#cad3f5"),
      cmdbar_bg: Some("#1e2030"),
      cmdbar_extra_lines_bg: Some("#1e2030"),
      disabled_fg: Some("#8087a2"),
      diff_line_add: Some("#a6da95"),
      diff_line_delete: Some("#ed8796"),
      diff_file_added: Some("#a6da95"),
      diff_file_removed: Some("#ee99a0"),
      diff_file_moved: Some("#c6a0f6"),
      diff_file_modified: Some("#f5a97f"),
      commit_hash: Some("#b7bdf8"),
      commit_time: Some("#b8c0e0"),
      commit_author: Some("#7dc4e4"),
      danger_fg: Some("#ed8796"),
      push_gauge_bg: Some("#8aadf4"),
      push_gauge_fg: Some("#24273a"),
      tag_fg: Some("#f4dbd6"),
      branch_fg: Some("#8bd5ca")
    '';
    # vim keybindings https://github.com/gitui-org/gitui/blob/master/vim_style_key_config.ron
    keyConfig = ''
      open_help: Some(( code: F(1), modifiers: "")),

      move_left: Some(( code: Char('h'), modifiers: "")),
      move_right: Some(( code: Char('l'), modifiers: "")),
      move_up: Some(( code: Char('k'), modifiers: "")),
      move_down: Some(( code: Char('j'), modifiers: "")),

      popup_up: Some(( code: Char('p'), modifiers: "CONTROL")),
      popup_down: Some(( code: Char('n'), modifiers: "CONTROL")),
      page_up: Some(( code: Char('b'), modifiers: "CONTROL")),
      page_down: Some(( code: Char('f'), modifiers: "CONTROL")),
      home: Some(( code: Char('g'), modifiers: "")),
      end: Some(( code: Char('G'), modifiers: "SHIFT")),
      shift_up: Some(( code: Char('K'), modifiers: "SHIFT")),
      shift_down: Some(( code: Char('J'), modifiers: "SHIFT")),

      edit_file: Some(( code: Char('I'), modifiers: "SHIFT")),

      status_reset_item: Some(( code: Char('U'), modifiers: "SHIFT")),

      diff_reset_lines: Some(( code: Char('u'), modifiers: "")),
      diff_stage_lines: Some(( code: Char('s'), modifiers: "")),

      stashing_save: Some(( code: Char('w'), modifiers: "")),
      stashing_toggle_index: Some(( code: Char('m'), modifiers: "")),

      stash_open: Some(( code: Char('l'), modifiers: "")),

      abort_merge: Some(( code: Char('M'), modifiers: "SHIFT")),
    '';

  };
}
