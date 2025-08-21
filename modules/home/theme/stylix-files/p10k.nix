{ config, ... }:

{
  home.file."p10k-stylix.zsh" = {
    target = ".config/zsh/p10k-stylix.zsh";
    text = ''
    # Override all Powerlevel10k colors with lib.stylix.colors from stylix

    # os_icon: OS identifier
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND="#${config.lib.stylix.colors.base01}"
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND="#${config.lib.stylix.colors.base05}"

    # prompt_char: prompt symbol
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND="#${config.lib.stylix.colors.base08}"

    # dir: current directory
    typeset -g POWERLEVEL9K_DIR_BACKGROUND="#${config.lib.stylix.colors.base0D}"
    typeset -g POWERLEVEL9K_DIR_FOREGROUND="#${config.lib.stylix.colors.base01}"
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND="#${config.lib.stylix.colors.base03}"
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND="#${config.lib.stylix.colors.base01}"

    # vcs: git status
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="#${config.lib.stylix.colors.base0A}"
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="#${config.lib.stylix.colors.base0C}"
    typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND="#${config.lib.stylix.colors.base03}"

    # status: exit code of the last command
    typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND="#${config.lib.stylix.colors.base01}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND="#${config.lib.stylix.colors.base01}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND="#${config.lib.stylix.colors.base01}"

    # command_execution_time: duration of the last command
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="#${config.lib.stylix.colors.base03}"

    # background_jobs: presence of background jobs
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="#${config.lib.stylix.colors.base0C}"

    # direnv: direnv status
    typeset -g POWERLEVEL9K_DIRENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_DIRENV_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # asdf: asdf version manager (default and specific tools)
    typeset -g POWERLEVEL9K_ASDF_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_ASDF_BACKGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_RUBY_BACKGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_PYTHON_BACKGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_GOLANG_BACKGROUND="#${config.lib.stylix.colors.base0D}"
    typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_NODEJS_BACKGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_RUST_BACKGROUND="#${config.lib.stylix.colors.base09}"
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND="#${config.lib.stylix.colors.base0E}"
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND="#${config.lib.stylix.colors.base0D}"
    typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_LUA_BACKGROUND="#${config.lib.stylix.colors.base0D}"
    typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_ASDF_JAVA_BACKGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_PERL_BACKGROUND="#${config.lib.stylix.colors.base0D}"
    typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_ERLANG_BACKGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND="#${config.lib.stylix.colors.base0E}"
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND="#${config.lib.stylix.colors.base0C}"
    typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_PHP_BACKGROUND="#${config.lib.stylix.colors.base0E}"
    typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_HASKELL_BACKGROUND="#${config.lib.stylix.colors.base0A}"
    typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ASDF_JULIA_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # nordvpn: nordvpn connection status
    typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_NORDVPN_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # ranger: ranger shell
    typeset -g POWERLEVEL9K_RANGER_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_RANGER_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # yazi: yazi shell
    typeset -g POWERLEVEL9K_YAZI_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_YAZI_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # nnn: nnn shell
    typeset -g POWERLEVEL9K_NNN_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_NNN_BACKGROUND="#${config.lib.stylix.colors.base0C}"

    # lf: lf shell
    typeset -g POWERLEVEL9K_LF_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_LF_BACKGROUND="#${config.lib.stylix.colors.base0C}"

    # xplr: xplr shell
    typeset -g POWERLEVEL9K_XPLR_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_XPLR_BACKGROUND="#${config.lib.stylix.colors.base0C}"

    # vim_shell: vim shell indicator
    typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # midnight_commander: midnight commander shell
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # nix_shell: nix shell
    typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # chezmoi_shell: chezmoi shell
    typeset -g POWERLEVEL9K_CHEZMOI_SHELL_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_CHEZMOI_SHELL_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # disk_usage: disk usage
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND="#${config.lib.stylix.colors.base0A}"
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND="#${config.lib.stylix.colors.base08}"

    # vi_mode: vi mode
    typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND="#${config.lib.stylix.colors.base0D}"
    typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND="#${config.lib.stylix.colors.base0A}"
    typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="#${config.lib.stylix.colors.base03}"

    # virtualenv: python virtual environment
    typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # anaconda: conda environment
    typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # pyenv: python environment
    typeset -g POWERLEVEL9K_PYENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_PYENV_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # goenv: go environment
    typeset -g POWERLEVEL9K_GOENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_GOENV_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # nodenv: node.js version from nodenv
    typeset -g POWERLEVEL9K_NODENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_NODENV_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # nvm: node.js version from nvm
    typeset -g POWERLEVEL9K_NVM_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_NVM_BACKGROUND="#${config.lib.stylix.colors.base0E}"

    # nodeenv: node.js environment
    typeset -g POWERLEVEL9K_NODEENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_NODEENV_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # node_version: node.js version
    typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # go_version: go version
    typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # rust_version: rustc version
    typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_RUST_VERSION_BACKGROUND="#${config.lib.stylix.colors.base09}"

    # dotnet_version: .NET version
    typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_DOTNET_VERSION_BACKGROUND="#${config.lib.stylix.colors.base0E}"

    # php_version: php version
    typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_PHP_VERSION_BACKGROUND="#${config.lib.stylix.colors.base0E}"

    # laravel_version: laravel php framework version
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_BACKGROUND="#${config.lib.stylix.colors.base05}"

    # rbenv: ruby version from rbenv
    typeset -g POWERLEVEL9K_RBENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_RBENV_BACKGROUND="#${config.lib.stylix.colors.base08}"

    # java_version: java version
    typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND="#${config.lib.stylix.colors.base05}"

    # package: name@version from package.json
    typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_PACKAGE_BACKGROUND="#${config.lib.stylix.colors.base0C}"

    # rvm: ruby version from rvm
    typeset -g POWERLEVEL9K_RVM_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_RVM_BACKGROUND="#${config.lib.stylix.colors.base03}"

    # fvm: flutter version management
    typeset -g POWERLEVEL9K_FVM_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_FVM_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # luaenv: lua version from luaenv
    typeset -g POWERLEVEL9K_LUAENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_LUAENV_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # jenv: java version from jenv
    typeset -g POWERLEVEL9K_JENV_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_JENV_BACKGROUND="#${config.lib.stylix.colors.base05}"

    # plenv: perl version from plenv
    typeset -g POWERLEVEL9K_PLENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_PLENV_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # perlbrew: perl version from perlbrew
    typeset -g POWERLEVEL9K_PERLBREW_FOREGROUND="#${config.lib.stylix.colors.base05}"

    # phpenv: php version from phpenv
    typeset -g POWERLEVEL9K_PHPENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_PHPENV_BACKGROUND="#${config.lib.stylix.colors.base0E}"

    # scalaenv: scala version from scalaenv
    typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_SCALAENV_BACKGROUND="#${config.lib.stylix.colors.base08}"

    # haskell_stack: haskell version from stack
    typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_HASKELL_STACK_BACKGROUND="#${config.lib.stylix.colors.base0A}"

    # terraform: terraform workspace
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # terraform_version: terraform version
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # kubecontext: current kubernetes context
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND="#${config.lib.stylix.colors.base0E}"

    # aws: aws profile
    typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_AWS_DEFAULT_BACKGROUND="#${config.lib.stylix.colors.base0A}"

    # aws_eb_env: aws elastic beanstalk environment
    typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_AWS_EB_ENV_BACKGROUND="#${config.lib.stylix.colors.base0B}"

    # azure: azure account name
    typeset -g POWERLEVEL9K_AZURE_OTHER_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_AZURE_OTHER_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # gcloud: google cloud account and project
    typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_GCLOUD_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # google_app_cred: google application credentials
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # toolbox: toolbox name
    typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_TOOLBOX_BACKGROUND="#${config.lib.stylix.colors.base0A}"

    # public_ip: public IP address
    typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND="#${config.lib.stylix.colors.base05}"

    # vpn_ip: virtual private network indicator
    typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_VPN_IP_BACKGROUND="#${config.lib.stylix.colors.base0C}"

    # ip: ip address and bandwidth usage
    typeset -g POWERLEVEL9K_IP_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_IP_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # proxy: system-wide http/https/ftp proxy
    typeset -g POWERLEVEL9K_PROXY_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_PROXY_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # battery: internal battery
    typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND="#${config.lib.stylix.colors.base08}"
    typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND="#${config.lib.stylix.colors.base0B}"
    typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="#${config.lib.stylix.colors.base0A}"
    typeset -g POWERLEVEL9K_BATTERY_BACKGROUND="#${config.lib.stylix.colors.base00}"

    # wifi: wifi speed
    typeset -g POWERLEVEL9K_WIFI_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_WIFI_BACKGROUND="#${config.lib.stylix.colors.base0D}"

    # time: current time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND="#${config.lib.stylix.colors.base00}"
    typeset -g POWERLEVEL9K_TIME_BACKGROUND="#${config.lib.stylix.colors.base05}"

    # example: user-defined prompt segment
    typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND="#${config.lib.stylix.colors.base05}"
    typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND="#${config.lib.stylix.colors.base08}"
  '';
  };
}
