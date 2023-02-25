# zsh-auto-nvm-use

zsh-auto-nvm-use is a zsh plugin that automatically loads the node version specified in .nvmrc.

The matching process will be performed in a continuously downgrading manner. For example, if the version v14.20.1 is declared in the .nvmrc file, it will be sequentially matched with v14.20.1, v14.20, and v14. If a corresponding version exists, it will be used directly without further matching. If none of the versions exist, a prompt to install the required version will be displayed:

```zsh
No suitable node version was found, please install through `nvm install v14.20.1`
```


## Installation

zplug

```zsh
zplug "tgmeng/zsh-auto-nvm-use", from:"github", use:"zsh-auto-nvm-use.zsh"
```
