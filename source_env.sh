#!/usr/bin/env bash
# ================================================================ #
# BadGradWiki Environment Setup Script                             #
# ---------------------------------------------------------------  #
# This script sets up (or updates) a local Python virtual          #
# environment for working on the BadGradWiki Sphinx documentation. #
#                                                                  #
# Behavior:                                                        #
#  - Looks for a .venv directory next to this script               #
#  - If found:                                                     #
#      * Activates it                                              #
#      * Ensures requirements.txt is fully installed               #
#  - If not found:                                                 #
#      * Creates a new virtual environment                         #
#      * Installs requirements.txt                                 #
#                                                                  #
# Safe to run multiple times.                                      #
# ================================================================ #
set -euo pipefail

# -------------------------------- #
# ENVIRONMENT VARIABLES & PATHS    #
# -------------------------------- #
# Set up the environmental variables for the script. Only the python executable
# needs to be obtained from the user side interface.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="${SCRIPT_DIR}/.venv"
REQ_FILE="${SCRIPT_DIR}/requirements.txt"
PYTHON_EXEC="python3"

# Extract the arguments from the command line and set the
# PYTHON_EXEC based on the ``--python`` flag.
while [[ $# -gt 0 ]]; do
  case "$1" in
    --python)
      PYTHON_EXEC="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: $0 [--python /path/to/python]"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# -------------------------------- #
# CHECKS                           #
# -------------------------------- #
# The next configuration step is to ensure that we can find the
# python executable and that the requirements.txt file exists.
# If either of these fail, we want to provide a pretty clear error message.
if ! command -v "${PYTHON_EXEC}" >/dev/null 2>&1; then
  echo "[ERROR]: The python executable (${PYTHON_EXEC}) was not found."
  echo "This probably indicates that you have not provided your python executable name to"
  echo "the script correctly, or that python is not installed on your system."
  echo "Please install python and/or provide the correct path to your python executable"
  echo "using the --python flag."
  exit 1
fi
if [[ ! -f "${REQ_FILE}" ]]; then
  echo "requirements.txt not found in ${SCRIPT_DIR}."
  echo "Is there something wrong with the project structure? Expected to find requirements.txt."
  echo "This error should be reported to the maintainers of BadGradWiki."
  exit 1
fi

# -------------------------------- #
# VENV ACTIVATION / CREATION       #
# -------------------------------- #
# We now need to either create or activate the virtual environment.
# First, we check if the .venv directory exists. If it does not, we create
# the virtual environment using the specified python executable.
# If it does exist, we simply activate it.
echo "[INFO]: Checking for existing virtual environment..."
if [[ ! -d "${VENV_DIR}" ]]; then
  echo "[INFO]: No .venv found. Creating virtual environment..."
  "${PYTHON_EXEC}" -m venv "${VENV_DIR}"
else
  echo "[INFO]: Found an existing virtual environment."
fi

# We can now proceed with activating the VENV.
echo "[INFO]: Activating the virtual environment..."
# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"

echo "[INFO]: Virtual environment activated:"
echo "   $(which python)"

# -------------------------------- #
# HANDLE DEPENDENCIES              #
# -------------------------------- #
# We now need to ensure that pip is up to date, and that all
# requirements are installed.
echo "⬆️  Ensuring pip is up to date..."
python -m pip install --upgrade pip >/dev/null

# ------------------------------
# Install / verify requirements
# ------------------------------
echo "📦 Checking and installing requirements..."
pip install -r "${REQ_FILE}"

# ------------------------------
# Final message
# ------------------------------
echo ""
echo "🎉 Environment setup complete!"
echo ""
echo "You are ready to work on BadGradWiki 🚀"
