#!/usr/bin/env bash
# This is a script usefull to only me, you can ignore it.
# FIXME: Imporove the script

path=$1

if [ -z "$path" ]; then
    echo "Please provide a path to your KeepassXC database"
    exit 1
fi

if [ -z "$password" ]; then
    echo -n "Enter password: "
    while IFS= read -p "$prompt" -r -s -n 1 char; do
        # Enter - accept password
        if [[ $char == $'\0' ]]; then
            break
        fi
        # Backspace
        if [[ $char == $'\177' ]]; then
            prompt=$'\b \b'
            password="${password%?}"
        else
            prompt='*'
            password+="$char"
        fi
    done
    echo
fi

mkdir -p ~/.ssh

ssh_private_key=$(echo -e "$password\n" | keepassxc-cli attachment-export "$path" "Development Accounts/SSH Key" id_ed25519 --stdout -q)

if [ $? -ne 0 ]; then
    echo "Wrong password"
    exit 1
fi

if [ -f ~/.ssh/id_ed25519 ]; then
    echo "SSH Private key already exists"
else
    echo "$ssh_private_key" >~/.ssh/id_ed25519
    chmod 600 ~/.ssh/id_ed25519
fi

ssh_public_key=$(echo -e "$password\n" | keepassxc-cli attachment-export "$path" "Development Accounts/SSH Key" id_ed25519.pub --stdout -q)

if [ -f ~/.ssh/id_ed25519.pub ]; then
    echo "SSH Public key already exists"
else
    echo "$ssh_public_key" >~/.ssh/id_ed25519.pub
    chmod 600 ~/.ssh/id_ed25519.pub
fi

echo "SSH keys populated"

gpg_private_key=$(echo -e "$password\n" | keepassxc-cli attachment-export "$path" "Development Accounts/GPG Key" gpg-key.asc --stdout -q)
gpg --import --batch --yes <(echo "$gpg_private_key")

gpg_public_key=$(echo -e "$password\n" | keepassxc-cli attachment-export "$path" "Development Accounts/GPG Key" gpg-key.pub --stdout -q)
gpg --import --batch --yes <(echo "$gpg_public_key")

echo "GPG keys populated"
