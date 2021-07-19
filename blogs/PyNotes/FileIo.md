---
title: python的文件读写操作
date: 2021-06-12
tags:
 - py笔记
categories:
 -  PyNotes
---
当我们想用python读取txt、csv这样的文件时（读取json文件时使用json模块下的dumps、loads、dump、load函数）便要用到python的文件操作函数。

---
## 一、open函数
第一步要用open函数打开文件。open()是python的内置函数，它会返回一个文件对象，这个文件对象拥有read、readline、write、close等方法。使用with语句会使代码变得更加简洁，不用再去关闭文件。

open函数有两个参数：
open('path','mode')
>path：需要打开的文件路径
>mode（可选）：打开文件的模式，如只读、追加、写入等
---
## 二、读取文件
### read()函数
将文件中的所有内容一次性全部读取出来，也可以读取指定字节的内容（换行代表一个字节）
![read](/pic/read.png)
### readline()函数
将文件内容一行一行读取，特点是：执行一次读取一行，如果要读取完文件，就要执行多次
![readline](/pic/readline.png)
### readlines()函数
将文件内容一行一行读取，特点是：一次性读取所有内容，并将每行的数据保存在一个列表
![readlines](/pic/readlines.png)

---
## 三、写文件
写文件的模式分为两种，分别是"w"和"a"
### "w"模式：覆盖写
>特点： 1、清空原文件内容
        2、文件不存在时会自动创建新文件
```python
with open("C:/Users/zhangqing/Desktop/test2.txt","w",encoding="utf-8") as f:
    f.write("今天6月15日")
```
运行结果：

![writew](/pic/writew.png)

f.flush()：有时我们用f.write()后，会发现没有写入文件，这是因为内容存在了缓冲区，需要等缓冲区满了之后，再把所有数据写入。此时可以用f.flush()强制把缓冲区里面的数据写到磁盘上。
### "a"模式：追加写
>特点：1、在原内容末尾添加新的内容
      2、文件不存在时会自动创建新文件
```python
with open("C:/Users/zhangqing/Desktop/test2.txt","w",encoding="utf-8") as f:
    f.write("明天6月16日")
```

运行结果：

![writea](/pic/writea.png)

---
## 四、文件指针
再来看一个例子
```python
with open("C:/Users/zhangqing/Desktop/test2.txt","r",encoding="utf-8") as f:
    tmp1=f.read()
    tmp2=f.read()
```
运行结果：

![指针](/pic/seek.png)
read读完之后，文件指针到了文件的末尾，此时read接着从这个位置开始读，肯定是没内容的。
在上面例子中我们加一句f.seek(num)便可以调整指针的位置，num代表从文件开头的字节数（注：英文每个字符占一个字节，每个汉字占两个字节）
```python
with open("C:/Users/zhangqing/Desktop/test2.txt","r",encoding="utf-8") as f:
    tmp1=f.read()
    f.seek(1)
    tmp2=f.read()
```
运行结果：

![指针](/pic/seek2.png)
可以看到在第一次读文件完成后，我们调整指针位置到第1个字节的位置，再调用read()函数就可以从第2个字节的位置继续读文件了。

---
[博客链接](https://www.cnblogs.com/testlearn/p/11793923.html)