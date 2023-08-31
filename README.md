
Dirijirse a la Pagina de NVIDIA para desargar el jetpack (Dependiendo de la versión de Ubuntu que se tenga instalada en la computadora se elegirá la versión de Jetpack )

En nuestro caso tenemos instalado Ubuntu 18.04 en la computadora por lo cual instalaremos   

[NVIDIA Jetpack 3.3.3](https://developer.nvidia.com/embedded/jetpack-3_3_3)


Conectar la fuente de alimenatcion a la Jetson 
Conectar a internet
contaseña ROS_UTM_2.4G=robotica
------------------------
Copiar en la computadora y en la jetson
-----------------------
La IP varia 
----------------------
 export ROS_MASTER_URI=http://192.168.43.xxx:11311
  export ROS_IP=192.168.43.xxx
 export ROS_HOSTNAME=192.168.43.xxx

 

 export ROS_MASTER_URI=http://192.168.43.178:11311
 export ROS_IP=192.168.43.192 
ssh robotica@192.168.43.178

 --------------------
 en la jetson se debe de levantar el turtlebot 
 --------------------
 NO OLVIDAR EL SOURCE 
  rosrun mov_turtle control_trayectoria_recta.py 
