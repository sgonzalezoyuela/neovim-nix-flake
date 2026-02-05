{
  treesitter =
    {
      enable = true;

      # Let nvim-treesitter compile and manage its own grammars at runtime.
      # This ensures queries and parsers are always in sync, avoiding
      # version mismatch errors (e.g. Python except* node type).
      # Compiled parsers are cached in ~/.local/share/nvim/
      grammarPackages = [ ];

      settings = {
        # Redirect parser installation to a writable directory outside the Nix store.
        # The Nix store is read-only, so nvim-treesitter cannot compile parsers there.
        # This path resolves to ~/.local/share/nvim/treesitter at runtime.
        parser_install_dir.__raw = "vim.fn.stdpath('data') .. '/treesitter'";

        # Performance optimizations for treesitter
        incremental_selection = { enable = true; };
        indent = { enable = false; }; # Keep disabled for performance
        # textobjects.enable = true; # Disabled - master branch frozen, main branch incompatible

        highlight = {
          enable = true;

          # Optimize highlighting performance
          disable = ''
            function(lang, bufnr)
              local line_count = vim.api.nvim_buf_line_count(bufnr)
              -- Disable for very large files
              if line_count > 10000 then
                return true
              end
              -- Disable for certain large filetypes that don't need highlighting
              local ft = vim.bo[bufnr].filetype
              if ft == "help" or ft == "man" then
                return true
              end
              return false
            end
          '';

          # Reduce highlighting update frequency for performance
          additional_vim_regex_highlighting = false;
        };

        # Let nvim-treesitter compile parsers on first use
        auto_install = true;
        ensure_installed = [ ]; # Parsers install automatically when needed

        # Performance settings
        sync_install = false;
      };
    };
}
