if (($env.PATH | split row (char esep) | any {|it| $it | str contains $'($env.HOME)/bin'}) == false) { 
    $env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/bin') 
}

$env.EDITOR = 'helix'
$env.ZELLIJ_AUTO_EXIT = 'true'
$env.JAVA_HOME = '/opt/android-studio/jbr'
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
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/Android/Sdk/cmdline-tools/latest')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/Android/Sdk/build-tools')
$env.PATH = ($env.PATH | split row (char esep) | append '/home/mentalist/Android/Sdk/emulator')
fnm env --json | from json | load-env
$env.PATH = ($env.PATH | append $"($env.FNM_MULTISHELL_PATH)/bin")
