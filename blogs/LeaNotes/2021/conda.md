---
title: Miniconda安装与学习
date: 2021-07-19
tags:
 - 学习笔记
categories:
 -  LeaNotes
---

## Miniconda安装
1. 进入[Miniconda官网](https://docs.conda.io/en/latest/miniconda.html#windows-installers)选择合适的版本进行下载。
2. 下载完成后点击下载好的exe文件进行安装，安装时选择好安装的路径，建议文件夹命名为Miniconda3。
3. 添加环境变量：将安装时的路径添加至计算机的系统变量Path里，环境变量配置图片如下。
![配置图片](/pic/env.png)
4. 命令行输入conda -V，看到如下信息，安装完成。
![安装完成](/pic/ver6.png)

5. 添加 conda 的镜像服务器(我用了反而更慢了)
```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```
## Miniconda简单使用
1.创建自己的虚拟环境，避免搞崩默认环境，利于版本控制。
创建虚拟的python3.6版本环境，并将其命名为py36,conda会为我们自动寻找3.6.x中的最新版本
```
conda create –n py36 python=3.6
```
激活刚才创建的虚拟环境：
```
conda activate py36
```
删除虚拟环境
```
conda remove -n py36 --all
```
查看当前存在的环境
```
conda env list
```

当前环境激活后输入python便可以使用该环境
![activatepy37](/pic/conda/py.png)
2.安装jupyternotebook,命令行输入以下命令：
```
conda install jupyter notebook
```
安装完成后只需要在cmd中激活需要在jupyter notebook里使用的python环境，然后使用
```
pip install ipykernel -i https://pypi.douban.com/simple
```
安装ipykernel:专为不同的python虚拟环境提供内核
