


Conectar a Jetson
------------------------
Conectar a internet
contaseña ROS_UTM_2.4G=robotica
------------------------
Copiar en la computadora y en la jetson
-----------------------
La IP varia 
----------------------
 export ROS_MASTER_URI=http://192.168.43.178:11311
  export ROS_IP=192.168.43.178
 export ROS_HOSTNAME=192.168.43.178

 

 export ROS_MASTER_URI=http://192.168.43.178:11311
 export ROS_IP=192.168.43.192 
ssh robotica@192.168.43.178

 --------------------
 en la jetson se debe de levantar el turtlebot 
 --------------------
 NO OLVIDAR EL SOURCE 
  rosrun mov_turtle control_trayectoria_recta.py 
