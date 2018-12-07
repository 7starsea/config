### Linux下如何让screen命令能够支持 tab completion

Linux相关目录: /usr/share/bash-completion


请将本目录下的文件或文件夹 拷贝到您的Linux机器目录 /usr/share/bash-completion 下。

如果您的Linux机器目录 /usr/share/bash-completion 已有相应的文件，则不需要替换。


如果您的home目录 ~/.bashrc 没有以下代码，则还需添加之。

```bash
# User specific aliases and functions
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
```

最后需要 source ~/.bashrc


---
### Belief
Write once, use everywhere.

### License
MIT 