# stunnel-tutorial

This is a playground to test the usage of stunnel with netcat using docker.

Run all scripts from the root folder (this one).

## Premise

Basically, there are two containers: the sender will use netcat to broadcast a random message, and the receiver will receive it.

The script to broadcast is [st-docker/send.sh](st-docker/send.sh), while the receiver is [st-docker/receive.sh](st-docker/receive.sh).

Both containers are run with the same image, that has both scripts, and are put in the same docker bridge network (which works basically like a VPC between the containers).

The result is saved in a file inside the receiver's container, which is mapped outside to `/logs/results`.

## Usage

There are a few scripts to be called on this folder:

* [kill.sh](kill.sh) - kills all the images, containers, etc (clears the docker env up)
* [setup.sh](setup.sh) - calls kill to get a clean slate, and then setup everything (create the docker image, setup the network, etc)
* [receiver.sh](receiver.sh) - actually runs the receiver container, leaves it runnings and returns the local ip associated in the network, but doesn't fire off the `receive.sh` process
* [sender.sh](sender.sh) - again, just runs the sender, doesn't fire off the actual `send.sh` process (but returns the ip)
* [run.sh](run.sh) - calls setup, receiver and sender, saving the ips, then docker exec's into both receiver and senders and kick the process off; after that, it tailf's the output file in the host to see the netcat working
* [mitm.sh](mitm.sh) - runs the man in the middle; run once the run script is running and you will be able to see everything, plain-text!

## stunnel

stunnel redirects one port to another. So, instead of our netcat sending stuff directly for our exit port (7890), it will use an auxiliary port (8080). The client netcat will send data to localhost:8080, and we will setup a stunnel to tunnel 8080 from localhost to 7890 to the reciever. This data path will be encrypted. On the other side, stunnel will be setup to redirect incoming traffic from 7890 to 8080, decrypting data on the process. Then, netcat will listen to 8080.

The following chart explains it in other words:

![chart](chart.png)

To use these, the scripts `secure_send.sh` and `secure_receive.sh` inside de dockers are run. A public/private key pair in the keys folder is used for encryption (please generate your own, don't use mine), and also the stunnel config files are copyed to the machines.

You can use the [secure_run.sh](secure_run.sh) to play it. Now, when you run the Man in the Middle, you will see the data is indeed encrypted!
