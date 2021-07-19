---
title: JS的隐式转化
date: 2021-07-03
tags:
 - 学习笔记
categories:
 -  LeaNotes
---
---
## 一、一个很牛的例子1
```javascript
const a = {
    i: 1,
    toString: function () {
    return a.i++;
    }
}
if (a == 1 && a == 2 && a == 3) {
    console.log('hello world!');
}
```
Q：这段代码执行的结果是什么？

A：控制台打印了'hello world!'

不禁让人引发思考，为什么？

---
## 二、隐式转换中主要涉及到三种转换：
1. 将值转为原始值，ToPrimitive()
2. 将值转为数字，ToNumber()
3. 将值转为字符串，ToString()
---
## 三、例子解释
1. 当执行a == 1 && a == 2 && a == 3 时，会从左到右一步一步解析，首先 a == 1，会执行ToPrimitive(a， Number) == 1。
**将a转化为原始值**
2. ToPrimitive(a, Number)，按照上面原始类型转换规则，会先调用valueOf方法，a的valueOf方法继承自Object.prototype。返回a本身，而非原始类型，故会调用toString方法。
**a.valueOf()=1   a.toString()='1'**
3. 因为toString被重写，所以会调用重写的toString方法，故返回1，注意这里是i++，而不是++i，它会先返回i，再将i+1。故ToPrimitive(a, Number) = 1。也就是1 == 1，此时i = 1 + 1 = 2。
**i++：先返回i，然后i做＋1操作**
**++i：i++，然后返回i**
4. 执行完a == 1返回true，会执行a == 2，同理，会调用ToPrimitive(a, Number)，同上先调用valueOf方法，在调用toString方法，由于第一步，i = 2此时，ToPrimitive(a, Number) = 2， 也就是2 == 2, 此时i = 2 + 1。
5. 同上可以推导 a == 3也返回true。故最终结果 a == 1 && a == 2 && a == 3返回true

---
## 四、隐式转换的规则
<img src="/pic/yinshizhaunhuan/1.png" width="50%" alt="1"/>

任意两种类型比较时，如果不是同一个类型比较的话，则按如图方式进行相应类型转换，如对象和布尔比较的话，对象 => 字符串 => 数值 布尔值 => 数值。

例1中a与数字进行比较，先将a进行隐式转换到字符，执行了重写的toString()函数，进而每次比较后都返回a，并且a进行了累加。

---
## 五、很有意思的例子2
```javascript
[] == false;
![] == false;
```
这两个的结果都是true,第一个:对象 => 字符串 => 数值0 false转换为数字0,这个是true应该没问题;
```javascript
[].toString()  
>>>''
Number('')     
>>>0
```

第二个前边多了个!，则直接转换为布尔值再取反，转换为布尔值时，空字符串(''),NaN,0，null,undefined这几个外返回的都是true, 所以! []这个[] => true 取反为false,所以![] == false为true。
```javascript
![]          
>>>false
Boolean([])  
>>>true
```
---
123参考链接：[JS隐式转换类型](https://www.jianshu.com/p/7cb41d109b7e)

45参考链接：[js中的隐式转换](https://www.cnblogs.com/chenmeng0818/p/5954215.html)
