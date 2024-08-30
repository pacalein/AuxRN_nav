# Execute the contents of ~/.bashrc
. ~/.bashrc

echo "Initializing virtualenv"

# Specify the path to your pyenv installation directory
export PYENV_ROOT="/root/mount/.pyenv"
# Add the specific Python 3.6 version to your PATH
export PATH="$PYENV_ROOT/versions/auxrn-env-3.6/bin:$PATH"
# Force pyenv to use Python 3.6
export PYENV_VERSION=auxrn-env-3.6

# Initialize pyenv
eval "$(pyenv init --path)"
# Activate the Python 3.6 environment
source /root/mount/.pyenv/versions/auxrn-env-3.6/bin/activate
echo "Virtualenv is ON"