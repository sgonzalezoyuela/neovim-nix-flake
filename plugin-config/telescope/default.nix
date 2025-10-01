{
  telescope = {
    enable = true;

    settings = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next";
            ["<C-k>"] = "move_selection_previous";
          };
        };
      };
    };

    extensions = {
      file-browser.enable = true;
      fzy-native.enable = true;
      ui-select.enable = true;

      frecency = {
        enable = true;

        settings = { db_safe_mode = false; };
      };
    };
  };
}
