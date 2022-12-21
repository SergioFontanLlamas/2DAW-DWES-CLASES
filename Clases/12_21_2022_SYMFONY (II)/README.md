Paso 1. Generar el proyecto.
Al no especificar version, se genera el proyecto en la ultima version posible
- Solo backend:         composer create-project symfony/skeleton 2daw
- Proyecto entero:      composer create-project symfony/website-skeleton 2daw

Paso 2. Servidor.
Necesito instalar un paquete para poder hacer funcionar mi aplicacion junto con apache.
- composer require symfony/apache-pack

Paso 3. Reconocimiento de la estructura de carpetas.
- bin           ----> contiene la consola de comandos 
- config        ----> contiene configuraciones del proyecto + el fichero routes.yaml
- public        ----> contiene nuestro index.php y es el sitio que se va a ejecutar por defecto en el proyecto.
- src           ----> contiene los CONTROLADORES, ENTITY (modelos).
- templates     ----> contiene las vistas del proyecto.
- var           ----> contiene la cache del proyecto y los logs.

Paso 4. Generar controlador.
- php bin/console make:controller CategoriaController

Paso 5. Generar ruta
En el fichero routes.yaml generamos una ruta con la siguiente estructura

# index:
#    path: /
#    controller: App\Controller\DefaultController::index

Paso 6. Fichero .env
Aqui configuramos la conexion a la base de datos con la siguiente estructura.
# DATABASE_URL="mysql://USUARIO:PASSWORD@127.0.0.1:3306/NOMBRE_BD?serverVersion=8&charset=utf8mb4"

Paso 7. Modelos o Entity
Genero las entidades.
De las entidades genero los modelos.
    7.1. Generar entidades:                         php bin/console doctrine:mapping:convert --from-database yml ./src/Entity

    7.2. Generar modelos:                           php bin/console doctrine:mapping:import App\\Entity annotation --path=src/Entity
    
    7.3. Generar getters y setters en el modelo:    php bin/console make:entity --regenerate App 

Paso 8. Enlazar dos paginas web
Poner en el href lo siguiente:
    caso a: enlace sin parametros                   {{ path('nombre') }}
    caso b: enlace con parametros                   {{ path('nombre') , {'variable': 'contenido'} }}

Paso 9. Generar el formulario

Paso 10. Generar save del formulario

Paso 11. Mostrar tabla en index

Paso 12. Clase Session
