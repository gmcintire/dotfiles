{ config, pkgs, ... }:

{
  system.defaults.dock.autohide = true;
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 20;
  system.defaults.NSGlobalDomain.KeyRepeat = 5;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;

  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  
  services.yabai.enable = true;
  services.yabai.package = pkgs.yabai;
  services.skhd.enable = true;

#  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ pkgs.vim
    pkgs.youtube-dl
    pkgs.tmux
    pkgs.pv
    pkgs.vault
    pkgs.jq
    pkgs.ctags
    pkgs.pstree
    pkgs.fish
    pkgs.bat
    pkgs.vault
    pkgs.fzf
    pkgs.lsof
    pkgs.htop
    pkgs.curl
    pkgs.wget
    pkgs.asdf
    pkgs.ctags
    pkgs.git
    pkgs.mosh
    pkgs.yarn
    pkgs.zsh
    pkgs.gnutls
    pkgs.neofetch
    pkgs.gawk
    pkgs.coreutils
    pkgs.silver-searcher
    pkgs.awscli
    pkgs.asciinema
    pkgs.hugo
    pkgs.lynx
    pkgs.w3m
    pkgs.nmap
    pkgs.terraform
    pkgs.tree
    pkgs.unzip
    pkgs.yarn
    pkgs.zip
    pkgs.vscode
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # programs.tmux.enable = true;
  # programs.tmux.enableSensible = true;
  # programs.tmux.enableMouse = true;
  # programs.tmux.enableFzf = true;
  # programs.tmux.enableVim = true;

  # programs.tmux.extraConfig = ''
  #   bind 0 set status
  #   bind S choose-session
  #   bind-key -r "<" swap-window -t -1
  #   bind-key -r ">" swap-window -t +1
  #   bind-key -n M-c run "tmux send-keys -t .+ C-\\\\ && tmux send-keys -t .+ C-a C-k C-l Up && tmux send-keys -t .+ Enter"
  #   bind-key -n M-r run "tmux send-keys -t .+ C-a C-k C-l Up && tmux send-keys -t .+ Enter"
  #   set -g pane-active-border-style fg=black
  #   set -g pane-border-style fg=black
  #   set -g status-bg black
  #   set -g status-fg white
  #   set -g status-right '#[fg=white]#(id -un)@#(hostname)   #(cat /run/current-system/darwin-version)'
  # '';

  # programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableBashCompletion = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfGit = true;
  programs.zsh.enableFzfHistory = true;

  programs.zsh.variables.cfg = "$HOME/.config/nixpkgs/darwin/configuration.nix";
  programs.zsh.variables.darwin = "$HOME/.nix-defexpr/darwin";
  programs.zsh.variables.nixpkgs = "$HOME/.nix-defexpr/nixpkgs";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  environment.variables.LANG = "en_US.UTF-8";

  environment.shellAliases.g = "git log --pretty=color -32";
  environment.shellAliases.gb = "git branch";
  environment.shellAliases.gc = "git checkout";
  environment.shellAliases.gcb = "git checkout -B";
  environment.shellAliases.gd = "git diff --minimal --patch";
  environment.shellAliases.gf = "git fetch";
  environment.shellAliases.ga = "git log --pretty=color --all";
  environment.shellAliases.gg = "git log --pretty=color --graph";
  environment.shellAliases.gl = "git log --pretty=nocolor";
  environment.shellAliases.grh = "git reset --hard";
  environment.shellAliases.l = "ls -lh";

  environment.shellAliases.ips = "iex -S mix phx.server";
  environment.shellAliases.ism = "iex -S mix";
  environment.shellAliases.mtp = "mix clean && mix compile.premailer && mix test";
  environment.shellAliases.start = "mix graphql && iex -S mix phx.server";

  nix.gc.automatic = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
