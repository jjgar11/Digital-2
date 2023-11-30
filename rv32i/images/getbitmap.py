from PIL import Image
import math
import sys

dir = './rv32i/images/'
image_name = dir + 'weird.png'
if len(sys.argv) != 2:
    print("Usage: python tu_script.py nombre_de_la_imagen.png")
    sys.exit(1)
image_name = sys.argv[1]
[image_name, ext] = image_name.split('.')
profundidad_bits = 12
# Abre la imagen original
imagen_original = Image.open(image_name + '.' + ext).resize((64, 64), Image.LANCZOS)


# Crea una nueva imagen con 4 bits por canal (12 bits en total)
imagen_bmp_4bits = imagen_original.convert('RGB', dither=Image.NONE, colors=2**profundidad_bits)

# Obtener las dimensiones de la imagen
ancho, alto = imagen_bmp_4bits.size

bits_r = math.ceil(profundidad_bits/3)
bits_g = math.ceil(profundidad_bits/3)
bits_b = math.ceil(profundidad_bits/3)

binary = ""

open(image_name + '.bin', 'wb').close()
with open(image_name + '.bin', 'ab') as f:
	# Recorrer los píxeles de la imagen y obtener los canales de color
	for y in range(alto):
		for x in range(ancho):
			numero_data = y*ancho+x
			pixel = imagen_bmp_4bits.getpixel((x, y))
			canal_rojo = math.floor(pixel[0] * 2**bits_r / 2**8)
			canal_verde = math.floor(pixel[1] * 2**bits_g / 2**8)
			canal_azul = math.floor(pixel[2] * 2**bits_b / 2**8)

			# Convierte los valores de los canales en binario
			binario_rojo = bin(canal_rojo)[2:].zfill(bits_r)  # 8 bits
			binario_verde = bin(canal_verde)[2:].zfill(bits_g)  # 8 bits
			binario_azul = bin(canal_azul)[2:].zfill(bits_b)  # 8 bits

			binary = binary + binario_rojo + binario_verde + binario_azul

	s = len(binary)
	char =[]
	for bit in binary:
		char.append(bit)
		if len(char) == 8:
			dec = int(''.join(char), 2)
			f.write(dec.to_bytes(1, byteorder='big'))
			char = []
f.close()

if image_name == "images/luffy":
	with open(image_name + '.bin.txt', 'w') as z:
		z.writelines(binary)
	z.close()

# Cierra la imagen original y la nueva
imagen_original.close()
imagen_bmp_4bits.close()