# Eggngineer's dotfiles

![prompt-image](./fig/Prompt.png)

## .tmux.conf
* `smooth-scrolling`と`mouse-operation`を有効
* Prefixのキーバインドを `C-b` から `C-q` に変更
* コピーモード（`C-q+[`）の操作はVimライクに設定
  * `hjkl`: 左下上右
  * `v`: 選択開始（`VISUAL`モード）
  * `V`: 行選択
  * `y`: 選択領域のヤンク
  * `y`: 行ヤンク
  * `C-p`: クリップ済みのテキストをペースト
## .zshrc
* source .zsh/*
##  .zsh
<pre>
.zsh
├── aliases.zsh
├── autoload.zsh
├── completions.zsh
├── functions.zsh
├── history.zsh
├── keybind.zsh
├── path_export.zsh
├── setopt.zsh
├── zle.zsh
└── zplug_plugin.zsh
</pre>
## Topics
### AppSpotLight (functions/fzf::spotlight)
MacOSのSpotlightのような検索機能です．筆者は`C-Space`にkeybindを振っています．

自分用に作ったのでかなりアドホックです．`/Applications/`,`/System/Applications/`,`/System/Applications/Utilities/`に入っている全てのアプリケーションを対象に曖昧検索を行い，選択されたアプリケーションを起動するように実装しています．

### BluetoothController (functions/fzf::bluetoothctl)
Bluetooth機器の接続/解除をコマンドラインで管理する機能です．筆者は`Ctrl-b`にkeybindを振っています．

### Misc
tmux関連の実装として，以下のような機能を追加しています．
* funcsions/make_tmux_session
  * セッションを命名しながら立ち上げる
* functions/tmux_selective_attach_session
  * tmuxセッションを選択的にアタッチする
  * セッション内でも使用できますが，`Prefix-a (default)`のスイッチングの方が使い勝手がいいと思います．
* functions/tmux_selective_kill_session
  * tmuxセッションを選択的に削除する