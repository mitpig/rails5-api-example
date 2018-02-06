# CRUD API
Proyecto de aplicación Ruby on Rails 5 y su modo API.

### Requisitos
* Ruby 2.4.1
* Rails 5.1.4

### Configuración
Antes de iniciar la aplicación se debe contar con un usuario que posea los privilegios necesarios para leer y escribir dentro de la base de datos.

##### Instalación de dependencias
Una vez clonado el repositorio debemos ejecutar el comando
```
bundle install
```

##### Conexión de la base de datos
Para configurar la conexión a base de datos se debe editar el archivo `config/database.yml` estableciendo las credenciales necesarias para la autenticación con el servidor MySQL.

```yaml
...
default: &default
  adapter: mysql2
  host: localhost
  encoding: utf8
  username: root
  password: admin123
...
```

##### Creación de la base de datos
Una vez configurada la conexión a la base de datos debemos ejecutar el comando
```
rails db:create
```
Ésto configurará las bases de datos necesarias para el uso de la aplicación.
Necesitaremos cargar nuestros datos de prueba, para ello se debe ejecutar
```
rails db < scripts/Users.sql
```
Con ésto ya configurado es posible levantar el servidor local con
```
rails s
```

### Endpoints
La aplicación responde a los endpoints listados a continuación

Método       | URL                      | Descripción
------------ | -------------            | -------------
POST         | /api/v1/login            | Autentica un usuario contra la base de datos.
POST         | /api/v1/users            | Crea un nuevo usuario en base a los parámetros. indicados
GET          | /api/v1/users/:username  | Muestra información de un usuario específico.
PUT          | /api/v1/users/:username  | Actualiza un usuario específico en base a los parámetros suministrados.
DELETE       | /api/v1/users/:username  | Elimina un usuario específico.

Para poder realizar cualquier solicitud de tipo CRUD además de los parámetros necesarios, se debe agregar el header `Authorization` con el valor de un JSON Web Token vigente, éste se puede obtener como respuesta al momento de realizar un login.

### Solicitudes a la aplicación
Dentro del proyecto se incluye la configuración básica de Postman para verificar las respuestas a los endpoints mencionados en el punto anterior, tal archivo se encuentra en la ruta `scripts/Snuuper API.postman_collection.json`

>NOTA: Se debe modificar el valor del header `Authorization` por un JSON Web Token vigente, éstos últimos están configurados para caducar dentro de 24 hrs.

### Test suite
Para configurar los test de la aplicación primero se deben crear datos de prueba dentro de la respectiva base de datos. Para ello ejecutar
```
RAILS_ENV='test' rails db < scripts/Users.sql
```
Ya con datos de prueba es posible ejecutar el comando
```
rspec
```
El cuál indicará si las operaciones REST se realizaron de forma correcta o existe algún inconveniente.
