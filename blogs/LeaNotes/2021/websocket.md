---
title: python+websocket服务器给客户端发消息
date: 2021-06-12
tags:
 - 学习笔记
categories:
 -  LeaNotes
---
本文实现的功能：
使用python作为websocket的服务端，服务端不断向客户端发送数据，客户端一直接收该数据即可。目前我的客户端使用了react里的websocket组件。
### 服务器端代码
```python
import asyncio
import websockets
import random
 
dic_send = 2
 
"""实现一直给客户端发消息，异步等待3秒，达到特定要求给客户端发送"""
async def echo(websocket, path):
    cnt = 0
    while True:
        x = random.randint(1,3)
        if x == dic_send:
            cnt +=1
            await websocket.send(str(cnt)+": "+str(dic_send)) # 第几个2传过来
        print(x)
        await asyncio.sleep(3)
 
 
start_server = websockets.serve(echo,'192.168.4.27',5678) # 地址改为你自己的地址
asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
```

### 客户端代码
```python
import asyncio
import websockets
 
 
async def hello(uri):
    async with websockets.connect(uri) as websocket:
        while True:
            recv_text = await websocket.recv()
            print("> {}".format(recv_text))
 
 
asyncio.get_event_loop().run_until_complete(
    hello('ws://192.168.4.27:5678')) # 地址改为你自己的地址
```
### 真实前端代码
```javascript
import React,{useEffect} from 'react'
import Draggable from 'react-draggable';
import Websocket from 'react-websocket';

function Test() {
    function onmessage(e){
        console.log("服务端发来数据：",e);
    }
    function onopen(){
        console.log('websocket 连接成功');    
    }
    function onclose(){
        console.log("websocket 连接关闭");
    }
    function onerror(e){
        console.log("发生错误"+e)
    }
    return (
        <div>
            <Websocket
                url='ws://127.0.0.1:5678'
                onMessage={onmessage}
                onOpen={onopen}
                onClose={onclose}
                onError={onerror}
                reconnect={true}
                debug={true}
            >
            </Websocket>
       </div>
    )
}
export default Test
```
### 效果图片
#### 前端（react部分）

![浏览器端](/pic/2.png)

#### 服务端（python文件）

![服务端](/pic/1.png)

[参考博客链接](https://blog.csdn.net/sdhdsf132452/article/details/113351489)