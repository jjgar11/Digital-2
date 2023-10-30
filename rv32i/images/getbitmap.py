from PIL import Image
import math

dir = './rv32i/images/'
image_name = 'test_stairs.png'
[image_name, ext] = image_name.split('.')
profundidad_bits = 3
# Abre la imagen original
imagen_original = Image.open(dir + image_name + '.' + ext)

# Crea una nueva imagen con 4 bits por canal (12 bits en total)
imagen_bmp_4bits = imagen_original.convert('RGB', dither=Image.NONE, colors=2**profundidad_bits)

# Obtener las dimensiones de la imagen
ancho, alto = imagen_bmp_4bits.size

open(dir + image_name + '.txt', 'w').close()
with open(dir + image_name + '.txt', 'a') as f:
	# Recorrer los píxeles de la imagen y obtener los canales de color
	for y in range(alto):
		for x in range(ancho):
			numero_data = y*alto+x
			pixel = imagen_bmp_4bits.getpixel((x, y))
			canal_rojo = math.floor(pixel[0] * 2**profundidad_bits / 2**8)
			canal_verde = math.floor(pixel[1] * 2**profundidad_bits / 2**8)
			canal_azul = math.floor(pixel[2] * 2**profundidad_bits / 2**8)

			# Convierte los valores de los canales en binario
			binario_rojo = bin(canal_rojo)[2:].zfill(profundidad_bits)  # 8 bits
			binario_verde = bin(canal_verde)[2:].zfill(profundidad_bits)  # 8 bits
			binario_azul = bin(canal_azul)[2:].zfill(profundidad_bits)  # 8 bits

			# print(f"Píxel ({x}, {y}): R = {binario_rojo}, G = {binario_verde}, B = {binario_azul}")
			f.writelines(binario_rojo + binario_verde + binario_azul + '\n')
f.close()
# Cierra la imagen original y la nueva
imagen_original.close()
imagen_bmp_4bits.close()