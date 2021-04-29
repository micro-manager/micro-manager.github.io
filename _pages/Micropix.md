Cameras from [http://micropiximaging.com/component/virtuemart/micropix-cameras Micropix ]

Currently only supports GigE models.  

On Mac OS X, The MTU of the GigE adapter MUST be changed to Jumbo frames (9000). See System Preferences -> Network -> Ethernet -> Advanced ->Ethernet -> MTU, or use command line "ifconfig". If a lower MTU is used, camera connection will drop when camera stream or control network traffic floods to NIC.

Also, a route for 255.255.255.255 may need to be added to point to the adapter on which the camera will be plugged (or to the switch on which the camera will be). This can be done with the following command:

  > sudo route -n add 255.255.255.255 169.254.42.97

where 169.254.42.97 is the IP (self-assigned or assigned by you) of the adapter
