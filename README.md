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

次のパッケージは再配布できないため、template だけを置いています。

- `claude-code`
- `intellij-idea`

使う場合は、手元の [void-packages](https://github.com/void-linux/void-packages) でビルドします。

```bash
./copy.sh ~/void-packages
cd ~/void-packages
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
./xbps-src pkg claude-code
sudo xbps-install --repository=hostdir/binpkgs/nonfree claude-code
```
