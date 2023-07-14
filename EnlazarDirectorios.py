import os  # Libreria para ejecutar comando de consola

# Proximas mejoras si existe el directorio .config/<programa>
# cambiarle el nombre y seguir con lo otro

def EnlazarDirectorio(programa):
    # Obtenemos la ruta del instalacion del .config del usuario
    # ademas sumando el nombre del programa a instalar
    ruta_config = os.path.expanduser("~") + f"/.config/{programa}"
    
    # Obtenemos la direccion del archivo .py para obtener la
    # direccion de la carpeta .config del repo para enlazarlo
    ruta_Enlace = os.path.dirname(
        os.path.abspath(__file__)) + f"/.config/{programa}"
   
    # Comando para crear en enlace simbolico
    comandoEnlazar = f"ln -s {ruta_Enlace} {ruta_config}"
    resultado = os.system(comandoEnlazar) # Ejecuta comando

def DesenlazarDirectorio(programa):
    # Obtenemos ruta de la configuracion a desenlazar
    ruta_config = os.path.expanduser("~") + f"/.config/{programa}"
    comando = f"unlink {ruta_config}"
    resultado = os.system(comando)

programas = ["qtile", "dunst", "picom","nvim" "alacritty"]


for i in programas:
    EnlazarDirectorio(i)



#print(EnlazarDirectorio("dunst"))
#print(DesenlazarDirectorio("dunst"))
