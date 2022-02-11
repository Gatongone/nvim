## 包含插件
* [packer.nvim](https://github.com/wbthomason/packer.nvim)
* [airline](https://github.com/vim-airline/vim-airline)
* [gruvbox](https://github.com/ellisonleao/gruvbox.nvim)
* [lsp](https://github.com/neovim/nvim-lspconfig)
* [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
* [defx](https://github.com/Shougo/defx.nvim)
* [rnvimr](https://github.com/kevinhwang91/rnvimr)
* [ZFVimIm](https://github.com/ZSaberLv0/ZFVimIM)
* [kommentary](https://github.com/b3nj5m1n/kommentary)
* [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
* [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)
* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
* [vista.vim](https://github.com/liuchengxu/vista.vim)
* [vim-autoformat](https://github.com/vim-autoformat/vim-autoformat)
* [far.vim](https://github.com/brooth/far.vim)
* [fzf.vim](https://github.com/junegunn/fzf)

## 使用此配置注意事项：

* 确保你安装了 neovim，安装方法：
```
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
```

* 确保你安装了 packer.vim，安装方法：
```
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

* 确保你安装了python3，安装方法：
```
    sudo apt-get install python3
    sudo ln -s /usr/bin/python3.6 /usr/bin/python
```

* 确保你安装了 pynvim，安装方法：
```
    python3 -m pip install pynvim
```
* 确保你安装了 nodejs，安装方法：
```
    sudo apt-get nodejs
```
* 确保你安装了 tree-sitter-cli，安装方法：
```
    npm install -g tree-sitter-cli
```
* 确保你安装了ranger，安装方法：
```shell
    sudo apt-get install ranger
```
* 确保你安装了 FZF，安装方法：
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

source ~/.zshrc
```

* 为你的终端安装 [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/) 字体（可选），安装方法：
    
    将字体添加到你的操作系统中：

    * Windows：C:\Windows\Fonts
    * Linux：/usr/share/fonts/truetype/

## 配置文件目录预览

```
📂 ~/.config/nvim
├── 📁 after                        # 在这里放其他 vimscript 配置文件
├── 📂 lua
│  ├── 📂 plugins_config            # 在这里放其他 lua 配置文件
│  └── 📂 core
│     ├── 🌑 keymapping.lua         # 键位映射文件
│     ├── 🌑 base.lua               # 基本配置文件
│     └── 🌑 plugins.lua            # 在这里引用其他 lua 配置文件
├── 📁 plugin
│  ├── 🌑 init.vim                  # 在这里引用其他的 vimscript 配置文件
│  └── 🌑 packer_compliled.lua      # packer安装完毕后自动生成
└── 🌑 init.lua                     # nvim入口
```

## 键位映射

建议将 capslock 绑定到 esc 键食用

| 模式     | 说明                       | 映射                       |
|----------|----------------------------|----------------------------|
| `normal` | 上                         | `i`                        |
| `normal` | 下                         | `k`                        |
| `normal` | 左                         | `j`                        |
| `normal` | 右                         | `l`                        |
| `normal` | 上移动10                   | `I`                        |
| `normal` | 下移动10                   | `K`                        |
| `normal` | 保存当前文件               | `Ctrl`+`s`                 |
| `normal` | 退出当前文件               | `Ctrl`+`q`                 |
| `normal` | insert模式                 | `Esc`                      |
| `normal` | virtual-block模式          | `b`                        |
| `normal` | 录制宏                     | `q`                        |
| `normal` | 播放宏                     | `h`                        |
| `normal` | 移动到行首并插入           | `q`                        |
| `normal` | 移动到行尾并插入           | `e`                        |
| `normal` | 全选                       | `Ctrl`+`a`                 |
| `normal` | 选择一行                   | `L`                        |
| `normal` | 垂直分屏                   | `sv`                       |
| `normal` | 水平分屏                   | `sh`                       |
| `normal` | 切换到上面的分屏           | `Alt`+`i`                  |
| `normal` | 切换到下面的分屏           | `Alt`+`k`                  |
| `normal` | 切换到左面的分屏           | `Alt`+`j`                  |
| `normal` | 切换到右面的分屏           | `Alt + l`                  |
| `normal` | 屏幕高度+1                 | `Ctrl`+`i`                 |
| `normal` | 屏幕高度-1                 | `Ctrl`+`k`                 |
| `normal` | 屏幕宽度+1                 | `Ctrl`+`l`                 |
| `normal` | 屏幕宽度-1                 | `Ctrl`+`j`                 |
| `normal` | 新建标签页                 | `t`                        |
| `normal` | 以新标签页方式打开终端     | `T`                        |
| `normal` | 以浮动窗口方式打开终端     | `Ctrl`+`t`                 |
| `normal` | 以垂直分屏方式打开终端     | `stv`                      |
| `normal` | 以水平分屏方式打开终端     | `sth`                      |
| `normal` | 切换到左边的标签           | `Alt`+`q`                  |
| `normal` | 切换到右边的标签           | `Alt`+`e`                  |
| `normal` | 切换输入法                 | `;;`                       |
| `normal` | 打开defx                   | `F`                        |
| `normal` | 打开ranger                 | `~`                        |
| `normal` | 选择文件                   | `Space`                    |
| `normal` | 复制文件                   | `yy`                       |
| `normal` | 粘贴文件                   | `pp`                       |
| `normal` | 剪切文件                   | `dd`                       |
| `normal` | 删除文件                   | `dD`                       |
| `normal` | 打开文件/进入目录          | `l`                        |
| `normal` | 重命名文件                 | `r`                        |
| `normal` | 重命名单词                 | `Ctrl`+`r`                 |
| `normal` | 重命名签名                 | `gr`                       |
| `normal` | 格式化代码                 | `Space`+`f`                |
| `normal` | 修改包裹代码               | `cs`                       |
| `normal` | 转到定义                   | `gd`                       |
| `normal` | 代码指令                   | `gd`                       |
| `normal` | 查看成员                   | `gm`                       |
| `normal` | 查讯诊断                   | `go`                       |
| `normal` | 跳转到上一个诊断           | `gj`                       |
| `normal` | 跳转到下一个诊断           | `gl`                       |
| `normal` | 查看签名文档               | `gh`                       |
| `normal` | 查询光标下单词的定义和引用 | `gw`                       |
| `normal` | 选择下一个补全             | `Ctrl`+`k`或`~`            |
| `normal` | 选择上一个补全             | `Ctrl`+`j`                 |
| `insert` | 确认补全                   | `Tab`                      |
| `insert` | 向右缩进                   | `Ctrl`+`l`                 |
| `insert` | 向左缩进                   | `Ctrl`+`j`或`Shift`+` Tab` |
| `insert` | 向上移动                   | `Alt`+`i`                  |
| `insert` | 向下移动                   | `Alt`+`k`                  |
| `insert` | 向左移动                   | `Alt`+`j`                  |
| `insert` | 向右移动                   | `Alt`+`l`                  |
| `visual` | 向右移动                   | `Alt`+`l`                  |
| `visual` | 向右缩进                   | `Ctrl`+`l`或`Tab`          |
| `visual` | 向左缩进                   | `Ctrl`+`j`或`Shift`+` Tab` |
| `visual` | 向上移动                   | `i`                        |
| `visual` | 向下移动                   | `k`                        |
| `visual` | 向左移动                   | `j`                        |
| `visual` | 向右移动                   | `l`                        |
| `visual` | 自动对齐                   | `Space`+`a`                |
| `visual` | 选择光标位资到行首         | `q`                        |
| `visual` | 选择光标位资到行尾         | `e`                        |
| `visual` | 选择一行                   | `L`                        |
| `visual` | 将选择内容向上移动一行     | `Alt`+`i`                  |
| `visual` | 将选择内容向下移动一行     | `Alt`+`k`                  |
| `visual` | 向右移动                   | `l`                        |
