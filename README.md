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
Necesitaremos cargar nuestros datos de prueba, para ello ejecutamos
```
rails db < scripts/Users.sql
```

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
