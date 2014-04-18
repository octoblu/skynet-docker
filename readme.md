```
 SSSSS  kk                            tt
SS      kk  kk yy   yy nn nnn    eee  tt
 SSSSS  kkkkk  yy   yy nnn  nn ee   e tttt
     SS kk kk   yyyyyy nn   nn eeeee  tt
 SSSSS  kk  kk      yy nn   nn  eeeee  tttt
                yyyyy
```
OPEN COMMUNICATIONS NETWORK & API FOR THE INTERNET OF THINGS (IoT)!

Visit [SKYNET.im](http://skynet.im) for up-to-the-latest documentation and screencasts.

======

Introduction
------------

SkyNet is an open source machine-to-machine instant messaging network and API. Our API supports both HTTP REST and realtime Web Sockets via RPC (remote procedure calls).  We also bridge [MQTT](http://mqtt.org) communications across our HTTP and Web Socket device channels.  

SkyNet auto-assigns 36 character UUIDs and secret tokens to each registered device connected to the network. These device credentials are used to authenticate with SkyNet and maintain your device's JSON description in our device directory.  

SkyNet allows you to query devices such as drones, hue light bulbs, weemos, arduinos, and server nodes that meet your criteria and send IM messages to 1 or all devices.

SkyNet includes a Node.JS NPM module called [SkyNet](http://skynet.im/#npm) and a [skynet.js](http://skynet.im/#javascript) file for simplifying Node.JS and mobile/client-side connectivity to SkyNet.

You can also subscribe to messages being sent to/from devices and their sensor activities.

Press
-----

[GigaOm](http://gigaom.com/2014/02/04/podcast-meet-skynet-an-open-source-im-platform-for-the-internet-of-things/) - Listen to Stacey Higginbotham from GigaOm interview Chris Matthieu, the founder of SkyNet, about our capabilities, uses, and future direction.

[Wired](http://www.wired.com/wiredenterprise/2014/02/skynet/) - ‘Yes, I’m trying to build SkyNet from Terminator.’

[LeapMotion](https://labs.leapmotion.com/46/) - Developer newsletter covers flying drones connected to SkyNet with LeapMotion sensor!

Installing with Docker
----------------------

The default Dockerfile will run Skynet, the 64 bit version of MongoDB, and Redis in a single container to make quick experiments easier. It runs on Ubuntu 12.04 LTS to ensure a stable environment.

You'll need docker installed, then to build the Skynet image:

From the directory where the Dockerfile resides run.

```
docker build -t=skynet-base .
```

This builds the base skynet Docker image. The base image does not include any skynet code, but instead holds build triggers that you can use to build a customized versionof skynet with your own settings.

To do so with this base image, go into your skynet codebase and run a docker build there with your personal skynet changes.

```
cd /path/to/your/skynet/
docker build -t=skynet-custom .
```

To run a fully self contained customized instance using the source bundled in the container.

```
docker run -i -t -p 3000 skynet-custom
```

This will run skynet and expose port 3000 from the container on a random host port that you can find by running docker ps.

If you want to do development and run without rebuilding the image you can bind mount your source directory including node_modules onto the container. This example also binds a directory to hold the log of stdout & stderr from the Skynet node process.

```
# docker run -d -p 3000 --name=skynet_dev -v /path/to/your/skynet:/var/www -v /path/to/your/logs:/var/log/skynet skynet
```

If you change the code restarting the container is as easy as:

```
# docker restart skynet_dev
```

FOLLOW US!
----------

* [Twitter/SKYNETim](http://twitter.com/skynetim)
* [Facebook/SKYNETim](http://facebook.com/skynetim)
* [Google Plus](https://plus.google.com/communities/106179367424841209509)


LICENSE
-------

(MIT License)

Copyright (c) 2014 Octoblu <info@octoblu.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
