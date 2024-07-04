# Execute the contents of ~/.bashrc
. ~/.bashrc

# Specify the path to your pyenv installation directory
export PYENV_ROOT="/root/mount/.pyenv"
# Add pyenv to your $PATH
export PATH="$PYENV_ROOT/bin:$PATH"
# Initialize pyenv
eval "$(pyenv init --path)"

# Initialize pyenv
source $HOME/.pyenv/versions/auxrn-env-3.6/bin/activate
echo "Virtualenv is ON /ᐠ - ˕ -マ"
