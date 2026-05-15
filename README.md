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
