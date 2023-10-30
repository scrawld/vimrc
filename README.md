# vimrc

## Install (安装)

如果您之前有定制自己的`Vim`配置，**请先备份`~/.vim`目录**，以下操作会覆盖`~/.vim`目录
```bash
# 下载配置文件
rm -rf ~/.vim && git clone https://github.com/scrawld/vimrc.git && mv vimrc ~/.vim

# 下载插件
vim -ec ":PlugInstall | qa" 2>/dev/null

# 配置golang环境后安装所有必需的二进制文件
vim +GoInstallBinaries +qa
```

## Uninstall (卸载)

如需恢复您原来的自定义配置，执行以下命令后，再将您原来的`.vim`目录还原至根目录即可
```bash
rm -rf ~/.vim
rm -rf ~/.vimtmp
```

## Upgrade Plugins (升级插件)

```bash
vim +PlugClean! +PlugUpdate +qa
```
