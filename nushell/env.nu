# Nushell Environment Config File
#
# version = "0.84.0"

def create_left_prompt [] {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)/($path_color)"
}


# def create_right_prompt [] {
#     # create a right prompt in magenta with green separators and am/pm underlined
#     let time_segment = ([
#         (ansi reset)
#         (ansi magenta)
#         (date now | format date '%Y/%m/%d %r')
#     ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
#         str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

#     let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
#         (ansi rb)
#         ($env.LAST_EXIT_CODE)
#     ] | str join)
#     } else { "" }

#     ([$last_exit_code, (char space), $time_segment] | str join)
# }

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| ""}

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

if (($env.PATH | split row (char esep) | any {|it| $it | str contains $'($env.HOME)/bin'}) == false) { 
    $env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/bin') 
}

$env.ZELLIJ_AUTO_EXIT = 'true'
$env.JAVA_HOME = '/home/mentalist/.local/share/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio/jbr/'
$env.COLORTERM = 'truecolor'
$env.HOMEBREW_CELLAR = '/home/linuxbrew/.linuxbrew/Cellar'
$env.HOMEBREW_PREFIX = '/home/linuxbrew/.linuxbrew'
$env.HOMEBREW_REPOSITORY = '/home/linuxbrew/.linuxbrew/Homebrew'
$env.ANDROID_HOME = '/home/mentalist/Android/Sdk/'
$env.CAPACITOR_ANDROID_STUDIO_PATH  = '/home/mentalist/.local/share/flatpak/app/com.google.AndroidStudio/current/active/files/extra/android-studio/bin/studio.sh'
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/.cargo/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/.phpenv/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/.phpenv/shims')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/.local/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/usr/local/sbin')
$env.PATH = ($env.PATH | split row (char esep) | append '/usr/local/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/usr/sbin')
$env.PATH = ($env.PATH | split row (char esep) | append '/usr/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/sbin, /bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/usr/games')
$env.PATH = ($env.PATH | split row (char esep) | append '/usr/local/games')
$env.PATH = ($env.PATH | split row (char esep) | append '/snap/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/Android/Sdk/tools')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/Android/Sdk/tools/bin')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/Android/Sdk/platform-tools')
fnm env --json | from json | load-env
$env.PATH = ($env.PATH | append $"($env.FNM_MULTISHELL_PATH)/bin")
