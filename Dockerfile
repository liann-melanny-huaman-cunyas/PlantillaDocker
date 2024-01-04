# IMAGEN BASADA EN LA APLICACION
FROM node:20.10.0-alpine3.18

# Agregar grupo y usuario
RUN addgroup react && adduser -S -G react react
# CAMBIAR DE USUARIO
USER react

# Mover a la carpeta (cd)
WORKDIR /app/

# Agregar un grupo y usuario
#   RUN addgroup react && adduser -S -G react react
# Cambiar de Usuario
#   User react

# Usar el usuario react
COPY --chown=react package*.json .

# Cuando construyes las imagenes
RUN npm install

#Pasar archivos de aplicacion
COPY --chown=react . .
# Pasar archivos de url
# ADD http://ww.miweb.com/archivos . 

# CONECTAR API O ALGUN ENTORNO
ENV API=https:://apiv1.miweb.com

# Cuando inician los contenedores
# no es remplazable
# Se puede asignar una variable de entorno

# INDICAR EL PUERTO DE MANERA DE DOCUMENTACION
EXPOSE 5173

# no puede ser remplazable
CMD [ "npm" ,"run","dev"]

# puede ser remplazable
#ENTRYPOINT [ "npm","run","dev" ]

