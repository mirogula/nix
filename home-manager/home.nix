{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "miro";
  home.homeDirectory = "/Users/miro";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Shells
    # fish
    # nushell
    neovim
    ripgrep
    # Terminals
    iterm2
    kitty
    #"kitty-0.44.0"
    ghostty-bin
    wezterm
    # SCM
    # git
    gh  # github cli
    jujutsu
    gnupg

    direnv
    deno

    yazi

    hledger
    hledger-ui
    lazydocker

    proton-vpn

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/miro/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.nushell.enable = true;
  programs.emacs = {
    enable = true;
    # emacs-macport provides deep integration with macOS features (e.g., native emojis, smooth scrolling)
    package = pkgs.emacs-macport; 
    
    # Inject user settings or custom configurations directly into init.el
    extraConfig = ''
      (setq inhibit-startup-screen t)
      (menu-bar-mode -1)
      (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
      (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
      (load-theme 'modus-vivendi t)
    '';
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Miroslav Gula";
        email = "mirogula@gmail.com";
        signingKey = "D338E14DE4DBA78B!";
      };
      commit.gpgSign = true;
      tag.gpgSign = true;
    };
    includes = [
      #     {
      #       condition = "gitdir:~/SCM/personal/";
      #	contents= {
      #	 user = {
      #          name = "Miroslav Gula";
      #	   email = "mirogula@gmail.com";
      #	   signingKey = "D338E14DE4DBA78B!";
      #         };
      #         commit.gpgSign = true;
      #	 tag.gpgSign = true;
      #	};
      #     }
      #     {
      #       condition = "gitdir:~/SCM/open-source/";
      #	contents= {
      #	 user = {
      #          name = "Miroslav Gula";
      #	   email = "mirogula@gmail.com";
      #	   signingKey = "D338E14DE4DBA78B!";
      #         };
      #         commit.gpgSign = true;
      #	 tag.gpgSign = true;
      #	};
      #     }
      {
        condition = "gitdir:~/SCM/work/slovak-telekom/";
        contents = {
          user = {
            name = "Miroslav Gula";
            email = "miroslav.gula@external.telekom.sk";
            signingKey = "D3DF8922953F534C";
          };
          commit.gpgSign = true;
          tag.gpgSign = true;
        };
      }
    ];
  };
}
