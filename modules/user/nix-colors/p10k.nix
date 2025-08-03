{ config, ... }:

{
  home.file."p10k-nixcolors.zsh" = {
    target = ".config/zsh/p10k-nixcolors.zsh";
    text = ''
    # Override all Powerlevel10k colors with colorScheme.palette from nix-colors

    # os_icon: OS identifier
    typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND="#${config.colorScheme.palette.base01}"
    typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND="#${config.colorScheme.palette.base05}"

    # prompt_char: prompt symbol
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND="#${config.colorScheme.palette.base08}"

    # dir: current directory
    typeset -g POWERLEVEL9K_DIR_BACKGROUND="#${config.colorScheme.palette.base0D}"
    typeset -g POWERLEVEL9K_DIR_FOREGROUND="#${config.colorScheme.palette.base01}"
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND="#${config.colorScheme.palette.base03}"
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND="#${config.colorScheme.palette.base01}"

    # vcs: git status
    typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="#${config.colorScheme.palette.base0A}"
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="#${config.colorScheme.palette.base0C}"
    typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND="#${config.colorScheme.palette.base03}"

    # status: exit code of the last command
    typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND="#${config.colorScheme.palette.base01}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND="#${config.colorScheme.palette.base01}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND="#${config.colorScheme.palette.base01}"

    # command_execution_time: duration of the last command
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="#${config.colorScheme.palette.base03}"

    # background_jobs: presence of background jobs
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="#${config.colorScheme.palette.base0C}"

    # direnv: direnv status
    typeset -g POWERLEVEL9K_DIRENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_DIRENV_BACKGROUND="#${config.colorScheme.palette.base00}"

    # asdf: asdf version manager (default and specific tools)
    typeset -g POWERLEVEL9K_ASDF_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_ASDF_BACKGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_RUBY_BACKGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_PYTHON_BACKGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_GOLANG_BACKGROUND="#${config.colorScheme.palette.base0D}"
    typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_NODEJS_BACKGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_RUST_BACKGROUND="#${config.colorScheme.palette.base09}"
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND="#${config.colorScheme.palette.base0E}"
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND="#${config.colorScheme.palette.base0D}"
    typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_LUA_BACKGROUND="#${config.colorScheme.palette.base0D}"
    typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_ASDF_JAVA_BACKGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_PERL_BACKGROUND="#${config.colorScheme.palette.base0D}"
    typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_ERLANG_BACKGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND="#${config.colorScheme.palette.base0E}"
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND="#${config.colorScheme.palette.base0C}"
    typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_PHP_BACKGROUND="#${config.colorScheme.palette.base0E}"
    typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_HASKELL_BACKGROUND="#${config.colorScheme.palette.base0A}"
    typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ASDF_JULIA_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # nordvpn: nordvpn connection status
    typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_NORDVPN_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # ranger: ranger shell
    typeset -g POWERLEVEL9K_RANGER_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_RANGER_BACKGROUND="#${config.colorScheme.palette.base00}"

    # yazi: yazi shell
    typeset -g POWERLEVEL9K_YAZI_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_YAZI_BACKGROUND="#${config.colorScheme.palette.base00}"

    # nnn: nnn shell
    typeset -g POWERLEVEL9K_NNN_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_NNN_BACKGROUND="#${config.colorScheme.palette.base0C}"

    # lf: lf shell
    typeset -g POWERLEVEL9K_LF_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_LF_BACKGROUND="#${config.colorScheme.palette.base0C}"

    # xplr: xplr shell
    typeset -g POWERLEVEL9K_XPLR_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_XPLR_BACKGROUND="#${config.colorScheme.palette.base0C}"

    # vim_shell: vim shell indicator
    typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_VIM_SHELL_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # midnight_commander: midnight commander shell
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_BACKGROUND="#${config.colorScheme.palette.base00}"

    # nix_shell: nix shell
    typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # chezmoi_shell: chezmoi shell
    typeset -g POWERLEVEL9K_CHEZMOI_SHELL_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_CHEZMOI_SHELL_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # disk_usage: disk usage
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND="#${config.colorScheme.palette.base0A}"
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND="#${config.colorScheme.palette.base08}"

    # vi_mode: vi mode
    typeset -g POWERLEVEL9K_VI_MODE_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND="#${config.colorScheme.palette.base0D}"
    typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_BACKGROUND="#${config.colorScheme.palette.base0A}"
    typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="#${config.colorScheme.palette.base03}"

    # virtualenv: python virtual environment
    typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # anaconda: conda environment
    typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # pyenv: python environment
    typeset -g POWERLEVEL9K_PYENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_PYENV_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # goenv: go environment
    typeset -g POWERLEVEL9K_GOENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_GOENV_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # nodenv: node.js version from nodenv
    typeset -g POWERLEVEL9K_NODENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_NODENV_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # nvm: node.js version from nvm
    typeset -g POWERLEVEL9K_NVM_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_NVM_BACKGROUND="#${config.colorScheme.palette.base0E}"

    # nodeenv: node.js environment
    typeset -g POWERLEVEL9K_NODEENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_NODEENV_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # node_version: node.js version
    typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # go_version: go version
    typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # rust_version: rustc version
    typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_RUST_VERSION_BACKGROUND="#${config.colorScheme.palette.base09}"

    # dotnet_version: .NET version
    typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_DOTNET_VERSION_BACKGROUND="#${config.colorScheme.palette.base0E}"

    # php_version: php version
    typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_PHP_VERSION_BACKGROUND="#${config.colorScheme.palette.base0E}"

    # laravel_version: laravel php framework version
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_LARAVEL_VERSION_BACKGROUND="#${config.colorScheme.palette.base05}"

    # rbenv: ruby version from rbenv
    typeset -g POWERLEVEL9K_RBENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_RBENV_BACKGROUND="#${config.colorScheme.palette.base08}"

    # java_version: java version
    typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND="#${config.colorScheme.palette.base05}"

    # package: name@version from package.json
    typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_PACKAGE_BACKGROUND="#${config.colorScheme.palette.base0C}"

    # rvm: ruby version from rvm
    typeset -g POWERLEVEL9K_RVM_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_RVM_BACKGROUND="#${config.colorScheme.palette.base03}"

    # fvm: flutter version management
    typeset -g POWERLEVEL9K_FVM_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_FVM_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # luaenv: lua version from luaenv
    typeset -g POWERLEVEL9K_LUAENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_LUAENV_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # jenv: java version from jenv
    typeset -g POWERLEVEL9K_JENV_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_JENV_BACKGROUND="#${config.colorScheme.palette.base05}"

    # plenv: perl version from plenv
    typeset -g POWERLEVEL9K_PLENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_PLENV_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # perlbrew: perl version from perlbrew
    typeset -g POWERLEVEL9K_PERLBREW_FOREGROUND="#${config.colorScheme.palette.base05}"

    # phpenv: php version from phpenv
    typeset -g POWERLEVEL9K_PHPENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_PHPENV_BACKGROUND="#${config.colorScheme.palette.base0E}"

    # scalaenv: scala version from scalaenv
    typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_SCALAENV_BACKGROUND="#${config.colorScheme.palette.base08}"

    # haskell_stack: haskell version from stack
    typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_HASKELL_STACK_BACKGROUND="#${config.colorScheme.palette.base0A}"

    # terraform: terraform workspace
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND="#${config.colorScheme.palette.base00}"

    # terraform_version: terraform version
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_TERRAFORM_VERSION_BACKGROUND="#${config.colorScheme.palette.base00}"

    # kubecontext: current kubernetes context
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND="#${config.colorScheme.palette.base0E}"

    # aws: aws profile
    typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_AWS_DEFAULT_BACKGROUND="#${config.colorScheme.palette.base0A}"

    # aws_eb_env: aws elastic beanstalk environment
    typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_AWS_EB_ENV_BACKGROUND="#${config.colorScheme.palette.base0B}"

    # azure: azure account name
    typeset -g POWERLEVEL9K_AZURE_OTHER_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_AZURE_OTHER_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # gcloud: google cloud account and project
    typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_GCLOUD_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # google_app_cred: google application credentials
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # toolbox: toolbox name
    typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_TOOLBOX_BACKGROUND="#${config.colorScheme.palette.base0A}"

    # public_ip: public IP address
    typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND="#${config.colorScheme.palette.base05}"

    # vpn_ip: virtual private network indicator
    typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_VPN_IP_BACKGROUND="#${config.colorScheme.palette.base0C}"

    # ip: ip address and bandwidth usage
    typeset -g POWERLEVEL9K_IP_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_IP_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # proxy: system-wide http/https/ftp proxy
    typeset -g POWERLEVEL9K_PROXY_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_PROXY_BACKGROUND="#${config.colorScheme.palette.base00}"

    # battery: internal battery
    typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND="#${config.colorScheme.palette.base08}"
    typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND="#${config.colorScheme.palette.base0B}"
    typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="#${config.colorScheme.palette.base0A}"
    typeset -g POWERLEVEL9K_BATTERY_BACKGROUND="#${config.colorScheme.palette.base00}"

    # wifi: wifi speed
    typeset -g POWERLEVEL9K_WIFI_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_WIFI_BACKGROUND="#${config.colorScheme.palette.base0D}"

    # time: current time
    typeset -g POWERLEVEL9K_TIME_FOREGROUND="#${config.colorScheme.palette.base00}"
    typeset -g POWERLEVEL9K_TIME_BACKGROUND="#${config.colorScheme.palette.base05}"

    # example: user-defined prompt segment
    typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND="#${config.colorScheme.palette.base05}"
    typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND="#${config.colorScheme.palette.base08}"
  '';
  };
}
