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
