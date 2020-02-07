## docker部署AutoPiano

[![LICENSE](https://camo.githubusercontent.com/41215df7ff78cefe41536bf897fe1c7e55b10bd2/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d416e74692532303939362d626c75652e737667)](https://github.com/996icu/996.ICU/blob/master/LICENSE) [![996.icu](https://camo.githubusercontent.com/13ac320a9a774e316fe72ffb1eaacf09b01b59a3/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c696e6b2d3939362e6963752d7265642e737667)](https://996.icu/)

> **项目地址：** [https://github.com/WarpPrism/AutoPiano](https://github.com/WarpPrism/AutoPiano)
>
> **演示地址：** [https://www.autopiano.cn](https://www.autopiano.cn/)

### 项目介绍

自由钢琴（AutoPiano）是利用HTML5技术开发的在线钢琴应用，致力于为钢琴爱好者、音乐爱好者以及其他所有的创造者提供一个优雅、简洁的平台，在学习工作之余可以享受钢琴、音乐的美好。就类似于多年前Flash开发的钢琴游戏，自由钢琴只是换了H5的技术，同时支持了钢琴曲的**自动播放**功能。

AutoPiano支持键盘按键和鼠标点击播放，同时琴键上会有按键和音名提示。另外，AutoPiano还有教学的功能，一种方式是`快速入门`，通过简易的谱子按键进行演奏，另一种是`演奏示例`，通过钢琴曲的自动播放来达到演示的目的。目前这两个功能都在持续完善中，如下图所示：

![autopiano.png](https://i.loli.net/2020/02/07/tTIPScXhux5bqsO.png)

### Dockerfile文件

```dockerfile
FROM node:lts-alpine

COPY AutoPiano /AutoPiano

WORKDIR /AutoPiano

RUN npm install && \
  npm run build

EXPOSE 5000

CMD node build/dev-server.js
```


