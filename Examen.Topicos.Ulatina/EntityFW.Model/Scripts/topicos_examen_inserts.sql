--INSERT_ADMIN--
INSERT INTO administrador (`nombre`,`estado`,`correo_electronico`) VALUES('Isidro',1,'isidrohernandez93@gmail.com');
----INSERT_CLIENT-------
INSERT INTO cliente (`monto_actual`,`nombre`,`apellido`,`estado`,`correo_electronico`) VALUES (10.0,'Moises','Hernandez',1,'ihh93@yahoo.es');
----INSERT_APUESTA-----
INSERT INTO apuesta (`terminos`,`fecha_creacion`,`duracion`,`id_administrador`,`veces_a_pagar`) VALUES ("GANA HEREDIA",CURDATE(),curdate(),1,3.5);
----INSERT_TRANSACTION-----
INSERT INTO transaccion (`id_administrador`,`id_cliente`,`tipo`,`detalle`,`monto`,`fecha_transaccion`) VALUES(1,1,"DEPOSITO","DEPOSITO DEL CLIENTE",10.30,CURDATE());
