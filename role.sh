#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <role>" >&2
  exit 1
fi

cd "$(dirname "$0")"

if [ ! -d "roles/$1" ]; then
  echo "Unknown role: $1" >&2
  echo "Available roles:" >&2
  ls roles >&2
  exit 1
fi

make install
sudo -E "${HOME}/.local/bin/uv" run ansible-playbook \
  -i localhost, -c local \
  ans_role.yml \
  -e "target_role=$1"
