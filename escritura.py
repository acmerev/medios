import time
import pyautogui
import keyboard

# Ruta del archivo a leer
archivo = "AdminVerificationBean.java"

# Leer el contenido del archivo
with open(archivo, "r", encoding="utf-8") as f:
    contenido = f.read()

input("Abre tu editor y presiona ENTER cuando estés listo...")
print("Comenzando en 5 segundos...")
time.sleep(5)

print("Presiona ESC para detener el programa mientras escribe.")

try:
    for caracter in contenido:
        if keyboard.is_pressed('esc'):
            print("\n⛔ Escritura detenida por el usuario.")
            break
        pyautogui.write(caracter)
        time.sleep(0.01)  # Simula escritura humana
except KeyboardInterrupt:
    print("\n⛔ Interrumpido manualmente.")

print("✅ Finalizado.")
