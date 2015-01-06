Personal Profile
================

I grew tired of deciphering the subtle difference between `.profile`,
`.bash_profile`, and `.bashrc` on every new system, so I created this.
To install, download and run `install.sh`. On systems with curl:

```sh
curl -fsSL https://raw.github.com/mdavidn/profile/master/install.sh | sh
```

Mac OS
------

Macs ship with an old version of SSH, which doesn't support newer
key exchange algorithms and ciphers. To upgrade using Homebrew:

```sh
brew tap homebrew/dupes
brew install openssh --with-brewed-openssl --with-keychain-support
```

Follow post-installation instructions for `org.openbsd.ssh-agent.plist`.
On each client, generate an RSA and Ed25519 key:

```ssh
ssh-keygen -t ed25519
ssh-keygen -t rsa -b 4096
```
