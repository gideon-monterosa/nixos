{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
  ];

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
  };
}
