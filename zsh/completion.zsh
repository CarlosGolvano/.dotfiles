# ====================================
# ZSH COMPLETION CONFIGURATION
# ====================================

# +---------+
# | BASIC   |
# +---------+

# Load additional completions (external plugins)
fpath=($DOTFILES/zsh/plugins/zsh-completions/src $fpath)

# Initialize completion system
autoload -U compinit
compinit

# Include hidden files in completion
_comp_options+=(globdots)

# +---------+
# | OPTIONS |
# +---------+

setopt AUTO_LIST            # Automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD     # Complete from both ends of a word
setopt ALWAYS_TO_END        # Move cursor to end after completion

# +---------+
# | BEHAVIOR |
# +---------+

# NO interactive menu - classic behavior
zstyle ':completion:*' menu no

# Basic completers
zstyle ':completion:*' completer _complete _approximate

# Use cache for slow commands
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"

# +---------+
# | MATCHING |
# +---------+

# Smart matching rules
zstyle ':completion:*' matcher-list \
    '' \
    'm:{a-z}={A-Z}' \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=* l:|=*'

# +---------+
# | COLORS   |
# +---------+

# Use ls colors for files
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Informative messages
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- No matches found --%f'

# +---------+
# | GROUPING |
# +---------+

# Group matches by category
zstyle ':completion:*' group-name ''

# Sort files by modification time (newest first)
zstyle ':completion:*' file-sort modification

# Order for different completion types
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# +----------+
# | COMMANDS |
# +----------+

# Kill command completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# SSH/SCP completion from known hosts
zstyle ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# +---------------+
# | APPROXIMATION |
# +---------------+

# Allow up to 2 errors for approximate completion
zstyle ':completion:*:approximate:*' max-errors 2 numeric

# Format for corrections
zstyle ':completion:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

# +----------+
# | GIT/VCS  |
# +----------+

# Git completion optimizations
zstyle ':completion:*:*:git:*' tag-order 'common-commands'
zstyle ':completion:*:*:git*:*' group-order 'main commands' 'alias commands' 'external commands'

# +----------------+
# | DOCKER/KUBECTL |
# +----------------+

# Docker completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# +------------------+
# | FILE EXCLUSIONS  |
# +------------------+

# Ignore certain file types
zstyle ':completion:*:*:(vim|nvim|nano):*:*files' ignored-patterns '*~' '*.o' '*.pyc' '*.class'
zstyle ':completion:*:*:rm:*:*files' ignored-patterns

# +-------------+
# | PERFORMANCE |
# +-------------+

# Faster completion for large directories
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache

# Only complete .zsh files for source command
zstyle ':completion:*:*:source:*' file-patterns '*.zsh:zsh-files' '*:all-files'