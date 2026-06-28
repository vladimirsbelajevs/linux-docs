# GIT SSH
## Generate SSH keys
```
ssh-keygen -t rsa-sha2-512 -C "your.email@domain.lv" -f ~/.ssh/id_rsa_work

ssh-keygen -t ed25519 -C "your.email@gmail.com" -f ~/.ssh/id_ed25519_personal
```

## Add host-key mapping

run 
```
micro ~/.ssh/config
```

Add these lines
```
Host github-me
    Hostname github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal
    IdentitiesOnly yes

Host devops-company
    Hostname ssh.dev.azure.com
    IdentityFile ~/.ssh/id_rsa_work
    IdentitiesOnly yes
```

Optionally if you have passphrases or your tools require agent auth
```
# Optional: add keys to ssh-agent if they have passphrases or your tools require agent auth  
ssh-add ~/.ssh/id_ed25519_personal  
ssh-add ~/.ssh/id_rsa_work
```

## Register domains as known hosts
```
ssh-keyscan github.com >> ~/.ssh/known_hosts

ssh-keyscan ssh.dev.azure.com >> ~/.ssh/known_hosts
```

## Registering generated SSH keys
Next you need to register the generated SSH keys in github azure devops. You can read the public keys you have generated like this.

```
cat ~/.ssh/id_rsa_work.pub
```

```
cat ~/.ssh/id_ed25519_personal.pub
```

## Later on each repo config your username and email using
```
git config user.name "YourName YourSurname"

git config user.email "your.email@gmail.com"
```

## Cloning repo
From folder where you want to clone run
```
git clone git@github.com:org/repo.git
```