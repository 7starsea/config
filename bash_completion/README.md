### Linux�������screen�����ܹ�֧�� tab completion

Linux���Ŀ¼: /usr/share/bash-completion


�뽫��Ŀ¼�µ��ļ����ļ��� ����������Linux����Ŀ¼ /usr/share/bash-completion �¡�

�������Linux����Ŀ¼ /usr/share/bash-completion ������Ӧ���ļ�������Ҫ�滻��


�������homeĿ¼ ~/.bashrc û�����´��룬�������֮��

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

�����Ҫ source ~/.bashrc


---
### Belief
Write once, use everywhere.

### License
MIT 