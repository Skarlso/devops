Mac OSX Minecraft Server in a Docker container
==============================================

Docker-Machine
--------------

* Create a docker-machine with ```docker-machine create --driver virtualbox --virtualbox-memory "8200" --virtualbox-cpu-count "2" default```
* After the machine is built, for it to be available online you have to port forward out of the machine as well as from the box. I did this through VirtualBox => Settings => Network => Adapter => Portforwarding => 192.168.0.X:25565. You have to specify the ip to be the one you are using for your public DNS forwarding.


Docker container
----------------

* Build the container with ```docker build -t minecraft:v0.1 .```
