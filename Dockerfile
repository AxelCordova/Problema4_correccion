#  Aqui especificamos la imagen base que Docker usará para construir el contenedor
FROM node:14

# Aqui se crea y establece una carpeta de trabajo dentro del contenedor en la cual se guardaran todos los comandos que se ejecuten permitiendo estar organizado
WORKDIR /app

# Aqui copiamos el archivo package.json y package-lock.json de nuestra maquina local a la carpeta del contenedor anteriaormente creada
COPY package*.json ./

# Aqui mientras se construye la imagen, instalamos  de igual manera dentro del contenedor, todas las dependencias de Node.js
RUN npm install

# Aqui copiamos el código de la aplicación desde tu máquina local al contenedor, el primer punto, se refiere al lugar de origen de la maquina local y el sugundo punto al lugar de destino, que es el contenedor
COPY . .

# Aqui abrimos el puerto 3000 en el contenedor para que este prepatado para recibir visitas desde cualquier navegador web
EXPOSE 3000

# Aqui inicializamos la aplicación Node.js, cuando el contenedor esté funcionando es importante estar seguro de ello.
CMD ["npm", "start"]