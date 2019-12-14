# このレポジトリについて

- QiitaのEmacsカレンダーにおけるコード例を表す
    - [URL](まだ)
- use-packageの拡張や移行として、下記を検討した
    - straight
    - quelpa
    - leaf

# テスト方法

```bash
# .bashrcとかに
alias quelpa='env HOME=${PATH_OF_REPO}/quelpa emacs'
alias straight='env HOME=${PATH_OF_REPO}/straight emacs'
alias leaf='env HOME=${PATH_OF_REPO}/leaf emacs'
```

``` bash
### bashなどで
$ quelpa
$ straight
$ leaf
```
