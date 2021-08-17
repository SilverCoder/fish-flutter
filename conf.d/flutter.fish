set -x FLUTTER_INSTALL "$HOME/.flutter"
set -x PATH $PATH "$FLUTTER_INSTALL/bin"

function _flutter_install
    git clone https://github.com/flutter/flutter.git $FLUTTER_INSTALL
end

function _flutter_completions
end

function _on_flutter_install --on-event flutter_install
    if not test -f "$FLUTTER_INSTALL/bin/flutter"
        _flutter_install
    end

    _flutter_completions
end

function _on_postexec_flutter_update --on-event fish_postexec
    if string match -qr '^flutter ugprade$' $argv
        _flutter_completions
    end
end
