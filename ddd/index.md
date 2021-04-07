## DTO class

Data transfer object, defines how data will be sent over the network.


# Domain

It's the common language to use between the client and the developers, It's build from
the requirements and becomes the model entities.
It should have the minimum data required.



# Bounded Contexts

Separar la aplicacion en multiples capas (bounded contexts):
- Mooc
- Backoffice
- Blog

Se separan en modulos:
- Modulos Mooc: Videos, Courses, Students...
- Modulos backoffice: Courses, Tickets, Students..

Lass aplicaciones (frontend) no se consideran bounded contexts, se comunican con ellos.

# Diferencia entre bounded context, micro servicios, subdomains, modules y shared kernel

Bounded contexts and subdomain are almost the same, BC are the solution, subdomain is the problem.
Shared kernel es un tipo de bounded context que tiene las cosas que se pueden reutilizar entre bounded contexts.




# Arquitectura de software

- Reglas autoimpuestas al definir cómo diseñamos software.
- Macro vs micro design: Macro design => arquitectura hexagonal, Micro design => patron repository, value object, etc...

## Beneficios arquitectura hexagonal:

- Mantenibilidad:
		- Evita crecimiento complejidad accidencial.
- Cambiabilidad
- Testing: Al trabajar con interfaces, podemos usar mock interfaces para testear mas facil.
- Simplifidad: Que en todos los sitios se trabaja igual, de forma que se hace predecible.

**Complejidad accidental**: Que al crecer el codigo, se termina tardando mucho mas a hacer cambios en el codigo


# Arquitectura hexagonal

Se basa en puertos y adaptadores.

Infrastructure -> Application -> Domain

## Infrastructure

Todo lo que vaya a tocar a un sistema real, ejemplo base de datos.
Cosas que pueden variar por decisiones externas.

### Servicios de infraestructura

Son los que tienen acceso a librerias externas.
En el constructor incluimos las variables extras que necessitamos, que no cumplen con la interficie.


## Application

Nuestro punto de entrada. Casos de uso son nuestros features, servicios, acciones.

### Servicio de aplicacion

Un servicio solo se deberia comunicar idealmente con un solo repositorio, si un repositorio se tiene que acceder entre
multiples servicios, es mejor crear un servicio de dominio de ese repositorio y usar ese servicio de dominio.

El servicio solo se encarga de coger datos o insertar en bd y ya, si hay que hacer mas cosas, se puede hacer una
cola de eventos, de forma que se hagan de forma asyncrona.

## Domain

- Value objects
- Interfaces de domini
- Entitys
- Servicios de dominio

### Domain Service

Si nuestro servicio de aplicacion por ejemplo, necessita comprobar que existe la entidad, para
poder hacer un update, podemos comprobarlo con un servicio de dominio.

Los servicios de aplicacion no se hablan entre si.
No hace falta usar interfaces para extraer el servicio de dominio, porque es nuestro.



## Repository

Esta en la capa de infraestructura.
Los servicios no acceden directamente a ello, acceden a una interficie de repository, esa interficie esta en capa domain.
Nos permite acceso a base de datos
Hace uso de data mapper "entity", para relacionarse con bd y devuelve datos en forma entity.
La alternativa seria active record, donde la entity tiene directamente los metodos de acceso a base de datos.


## Value object

Pasar parametros al constructor del dominio, como ValueObjects, en vez de primitivas como string o integer.
De modo que podamos validar que sus formatos sean correctos.

Los value objects se crean en el controller, desde el Request object.


## Aggregate

Basicamente, para evitar hacer joins en base de datos y dar mucha responsabilidad a una clase, separamos
cada join por una clase separada y nos quedamos solo con las foreign keys.

Desde el agregate root, podemos gestionar para enviar eventos en cada accion del agragado.

Por tanto pasamos de 
```
Course
```
a
```
Course
CourseReview
CourseRating
```

Del cual creamos un modulo por cada agregado


## Dependency Injection

Adaptar la interfaz al contrato y no a la implementacion. No simplemente convertir
una interfaz con los metodos del repositorio tal cual, sino que tiene que ser generalista.

Para ello usamos Criteria.

Para lograr eso, trabajamos outside in, es decir, primero definir la interface y despues la implementacion
