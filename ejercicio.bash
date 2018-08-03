#!/bin/bash

declare -a opciones=("Crear un Archivo" "Crear un directorio" "Cambiar perimsios de fichero" "Listar directorio" "Salir")
select opcion in "${opciones[@]}"
do
	if [ "$opcion" = "Crear un Archivo" ]
	then
		echo "nombre del archivo"
		read nombrearchivo
		echo "desea guardarlo en este directorio (y/n)" 
		pwd
		read respuesta
		if [ $respuesta = "y" ]
		then
			touch "$nombrearchivo"
			ls -la
			break
		elif [ $respuesta = "n" ]
		then
			echo "escriba la ruta:"
			read ruta
			touch "$respuesta" "$ruta"
			ls -la "$ruta"
			break
		else
			echo "error 404"
			break 
		fi
		break
	elif [ "$opcion" = "Crear un directorio" ]
	then
		echo "nombre del directorio"
		read nombrearchivo
		echo "desea guardarlo en este directorio (y/n)" 
		pwd
		read respuesta
		if [ $respuesta = "y" ]
		then
			mkdir "$respuesta"
			break
		elif [ $respuesta = "n" ]
		then
			echo "escriba la ruta:"
			read ruta
			touch "$respuesta" "$ruta" 
			break
		else
			echo "error 404"
			break 
		fi
		break
	elif [ "$opcion" = "Cambiar perimsios de fichero" ]
	then
		echo "Ruta absoluta del fichero a cambiar: " 
		read rutaAbsoluta
		#permiso dueño
		#permiso grupo
		#permiso otros
		echo "nada = 0"
		echo "escribir = 4"
		echo "leer = 2"
		echo "ejecutar = 1"
		echo "Permisos dueño: "
		read duenio
		echo "permiso grupo: "
		read grupo
		echo "permisos otros: "
		read otro
		chmod "$duenio$grupo$otro" "$rutaAbsoluta"
		break
	elif [ "$opcion" = "Listar directorio" ]
	then
		echo "Ruta absoluta del directorio: " 
		read rutaAbsoluta2
		ls -la "$rutaAbsoluta2"
		break
	elif [ "$opcion" = "Salir" ]
	then
		echo "adios"
		break
	else
		break
	fi
done
