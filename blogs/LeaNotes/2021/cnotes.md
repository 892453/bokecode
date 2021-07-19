---
title: c语言学习的一些笔记
date: 2021-06-29
tags:
 - 学习笔记
categories:
 -  LeaNotes
---

## while循环里的y--和--y
# 例1：
```
int y=9;
while(y--){
    printf("%d\n",y);
}
printf("y:%d",y);
```
程序输出结果

![tu](/pic/cnotes/1.png)

解释：
while(y--)相当先判断y的值符不符合while循环要求，然后再做y--，最后进入循环

所以本程序循环至y==1时可以继续，y==0时不符合while循环要求，但仍然执行了y--，只是没有进入循环体

所以最终打印到y=0，而程序结束时y的值为-1
# 例2
同理可得，while(--y)即为先对y-1，然后判断y的值是否满足循环条件。
```
int y=9;
while(--y){
    printf("%d\n",y);
}
printf("y:%d",y);
```
可想而知，最终打印的y为1，循环结束时y=0
验证一下：

![tu](/pic/cnotes/2.png)

## 各种数据类型所占的字节数
>int：4 byte  
char：1 byte  
float：4 byte  
double：8 byte  
short：2 byte  
long：4 byte  
long long：8 byte  
指针：8 byte  

记事本中字符占据的空间：
>汉字：3字节  
字母：1字节  
数字：1字节  
空格：1字节  
回车：2字节  

## 一点点关于指针
p是一个指针，它指向一个地址，&p是指针p所指向的具体地址。*p和p均可以被赋值。

>p=xxx：p指向的地址被赋值  
*p=xxx: p指向地址的数据被赋值