#!/bin/bash

set -euo pipefail

VOID_PKGS="${1:-$HOME/void-packages}"
OVERLAY_ROOT="$(pwd)"
OVERLAY_SRCPKGS="${OVERLAY_ROOT}/srcpkgs"
TARGET_SRCPKGS="${VOID_PKGS}/srcpkgs"

copy_file() {
    src_path="$(pwd)/${1}"
    file_name="$(basename "${1}")"
    target_path="${2}/${file_name}"
    if [[ -L "$target_path" ]]; then
        echo -e "$file_name \033[33mremoving symlink\033[0m"
        rm -f "$target_path"
    fi
    if [[ -d "$target_path" ]]; then
        echo -e "$file_name \033[33mremoving existing directory\033[0m"
        rm -rf "$target_path"
    fi
    if [[ -f "$target_path" ]]; then
        echo -e "$file_name \033[33mremoving existing file\033[0m"
        rm -f "$target_path"
    fi
    cp -a "$src_path" "$target_path"
    echo -e "$file_name \033[32mcopied\033[0m"
}

for pkg in "${OVERLAY_SRCPKGS}"/*; do
    [[ -e "$pkg" ]] || continue
    rel_path="srcpkgs/$(basename "$pkg")"
    copy_file "$rel_path" "$TARGET_SRCPKGS"
done
