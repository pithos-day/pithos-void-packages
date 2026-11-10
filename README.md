# pithos-void-packages
 
Void Linux 向けのカスタムXBPSリポジトリです。
 
## リモートリポジトリの追加
 
```bash
echo 'repository=https://void.pithos.day' > /etc/xbps.d/pithos-remote-repo.conf
```
 
その後、パッケージリストを更新します
 
```bash
sudo xbps-install -S
```

## リポジトリで配布していないパッケージ

次のパッケージは template だけを置いています。再配布できない、または GitHub のファイルサイズ上限 (100MB) を超えるためです。

- `claude-code`
- `intellij-idea`
- `t3code`

使う場合は、手元の [void-packages](https://github.com/void-linux/void-packages) でビルドします。

```bash
./copy.sh ~/void-packages
cd ~/void-packages
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
./xbps-src pkg claude-code
sudo xbps-install --repository=hostdir/binpkgs/nonfree claude-code
```

`t3code` は `hostdir/binpkgs`、`claude-code` と `intellij-idea` は `hostdir/binpkgs/nonfree` に出力されます。
