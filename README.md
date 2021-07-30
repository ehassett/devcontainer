# devcontainer

Use this image as a base for your Docker devcontainer.

## Usage
Add, at minumum, the following to `.devcontainer/devcontainer.json` or `.devcontainer.json` in your VS Code project:
```json
{
  "image": "ghcr.io/ethanhassett/devcontainer:latest"
}
```

A more full-featured `.devcontainer.json` looks like this:
```json
{
  "image": "ghcr.io/ethanhassett/devcontainer:latest",
  "name": "devcontainer",
  "extensions": [
	  "hashicorp.terraform",
    "golang.go",
    "ms-python.python",
	  "qcz.text-power-tools"
  ],
  "mounts": ["source=${localEnv:HOME}${localEnv:USERPROFILE}/.ssh,target=/root/.ssh,type=bind,consistency=cached"],
  "workspaceMount": "source=${localWorkspaceFolder},target=/root/Repos,type=bind,consistency=delegated",
  "workspaceFolder": "/root/Repos",
  "settings": {
    "terminal.integrated.cwd": "/root/Repos",
    "terminal.integrated.defaultProfile.linux": "zsh"
  }
}
```

## Packages
The following packages (and some unlisted dependencies) are installed on the devcontainer image in `bootstrap`:

- [git-chglog](https://github.com/git-chglog/git-chglog)

- [Go](https://golang.org), currently version 1.16.4

- [Oh My Zsh](https://ohmyz.sh/)

- [Python 3.9](https://www.python.org/)

- [Terraform](https://terraform.io)
  - [tfvm](https://github.com/ethanhassett/tfvm), installs Terraform version 1.0.0