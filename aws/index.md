# Infraestructura global

## Centro de datos

Se crean en clusters en diversas regiones globales

Todos los centros de datos estan en linia sirviendo a los clientes.

En caso de fallo, los procesos automaticos alejan el trafico de datos del cliente de area afectada.

### Zonas de disponibilidad AZ

Los centros de datos estan organizados en zonas de disponibilidad AZ, cada zona tiene 
multiples centros de datos. 1 centro de datos solo esta disponible en una zona de disponibilidad.

Es importante usar mas de 1 zona de disponibilidad para la aplicacion, ya que en caso de fallo,
el trafico saltaria en la nueva zona de disponibilidad sin interrumpirse el servicio.

### Regiones

Las zonas de disponibilidad se reparten entre regiones.

Cada region tiene 2 o mas AZ

# Servicio de ubicaciones Edge

Caches de bordes regionales que utilitzamos por defecto con cloudfront

Por ejemplo, espanya no tiene zona de disponibilidad, por tanto los datos pasan
por el servidor Edge.

# Servicio gestionado

Si un servicio de aws es gestionado, Aws se encarga del escalado, la toreancia a fallas y disponibilidad.

Sino, tiene que ser administrado por uno mismo.

Por ejemplo, un EC2 no escala por si mismo porque no es un servicio administrado.

En cambio, S3 si escala por si mismo porque es un servicio administrado.

# EC2

Servidor en la nube

## Autoscaling

Para que se escale de forma automatica la capacidad de computo del EC2

## Elastic Load Balancing

Distribuye automaticamente el trafico a partir de multiples instancias, para evitar fallas.

## EBS

Volumen de datos para almacenamiento en disco en instancias EC2.

# VPC

Red virtual personal y totalmente aislada.

## AWS direct connect

Permite a las organizaciones establecer una conexion de red dedicada desde su centro
de datos a AWS. Basicamente como un VPN.

## Amazon Route 53

Servicio DNS. Tambien sirve como registrador de dominio.

# Amazon Cloudfront

Para distribuir contenido con la menor latencia possible.

# Base de datos

## RDS

Base de datos relacional.

## Amazon DynamoDB

Base de datos No relacional, con gran rendimiento.

## Amazon Redshift.

Base de datos para Big data, con capacidad de terabytes.

## Amazon elastic cache

TODO

# Management tools

## CloudTrail

Para monitorizar el uso de los recursos de AWS.

# Securidad y control de acceso

## IAM

Controlar acceso a servicios.

## KMS

Servicio para encryptar datos.

## Aws certificate manager

Certificados SSL y TSL.

## WAF

Controlar el trafico que puede llegar, Firewall.

# Servicios de aplicaciones

## Api gateway

## SNS

## SES

Sistema de corre eletronico.

## SQS

Sistema de colas de mensaje.


# IAM

En capa gratis de AWS.

## Usuario root

Acceder con correo i contraseña.

Solo se deberia entrar como root para crear usuarios IAM, se deberia trabajar solo
con usuarios IAM.

## IAM usuario i password.

1. Crear usuario
2. Darle credenciales
3. Ponerlo en grupo
4. Darle algunos privilegio.

## MFA

Para autenticar via mobil, seguridad extra.

Ir al usuario y activar el checkbox de MFA.

# EC2

Crear key pairs para conectarse desde ssh.

Al crear la instancia, darle al boton de connect y saldra el comando ssh para conectarse.

Darle permisos 600 al pem, para restringir acceso y permita acceder ssh.

usar el commando ssh que aparece del estilo.

```
ssh -i "tutorial.pem" ec2-user@ec2-54-199-176-122.ap-northeast-1.compute.amazonaws.com
```

## AMI (Amazon Machine images)

Imagen de docker para una instancia EC2

## Bootstart

Al crear una instancia, en opciones avanzadas al final de todo que pone
User data con un textarea, se puede incluir comandos que se ejecutaran una vez
se cree la instancia.

## Tipo de instancias

1. Compute optimized (CPU)
2. FPGA instances: Para aplicaciones de accion de hardware
3. GPU graphics: Para graficos. Acceptan opengl.
4. Optimizadas a memoria
5. Optimizadas a almacenamiento

## Precios

https://aws.amazon.com/es/ec2/pricing/
Hay 4 formas de pagar en EC2:

1. **On demand**: Pagas por capacidad. Para usuarios que quieren pagar a bajo coste sin pagos por adelantado. Apps con cargas de trabajo a corto plazo.
2. **Spot instances**: Solicitar capacidad de aws EC2 sobrante con descuentos del 90%. Para apps con hora de inicio y finalizacion flexibles.
3. **Reserved instances** Descuento de hasta 75% en comparacion a ondemand. Se reserva la instancia para entre 1 a 3 años
4. **Dedicated hosts**: Instancias en servidores de aws dedicados solo para ti. Te permite ahorrar costos incluyendo licencias de pago en tu servidor como windows server, sql server, oracle.
Estas licencias  se pueden obtener con descuento hasta el 70% frente a ondemand.

Amazon linux y ubuntu cobran por segundo. La unidad minima cobrada son 60secs aunque la uses menos.

Los demas OS cobran por hora.

Se puede activar monitoring para monitorizar cada 1min en vez de 5min por pagos adicionales.

## Limite de instancias.

Hay un limite de instancias simultaneas que se pueden arrancar.
En Sidebar/Limits pone el limite, son 20 por default.

## Status check

1. System status check: Hardware, si al servidor de aws le ha pasado algo.
2. Instance status check: Software, si algo que has instalado falla.

# Grupos de seguridad

## Inbound

Para permitir el trafico de entrada. Ej: poder acceder ssh, http, etc a ciertas ips.

## Outbound

Permitir el trafico de salida. No es necesario definirlo en EC2, si no hay nada coje el estado
de inbound. (stateful)

En caso de vpc si es necesario definirlo porque son (stateless)


# VPC

1 subred = 1 zona de disponibilidad

subret publica = redirige el trafico a internet

## Subred

Hay 4 IPv4 reservadas que no pueden usarse (1,2,3,255)

1 subred = 1 zona de disponibilidad

subret publica = redirige el trafico a internet

## IGWS Internet gateways

Proporciona una ruta para el trafico a internet.
Solo podemos enjuntar 1 IGW por VPC.

## Routing tables

Para determinar hacia donde se dirige el trafico.

Por defecto tenemos una ruta local para que las subredes se puedan conectar entre si.
Sirve para asociar hacia donde puede ir el trafico de las subnets.

Para crear una subnet publica, hay que asignarla a una routing table a 0.0.0.0/24 y un
internet gateway.

## EIP Elastic Ip

Direccion Ip publica i estatica "no cambia".
Te cobran por ellos aunque no los uses, asi que es importante eliminarlos si no estan en uso.

## ENIS Elastic network interfaces

Interfaz de red virtual que puedes adjuntar a una instancia o un vpc de amazon.
Estan asociadas a una subred en el momento de su creacion.

## Endpoint

Conexion privada entre AWS i otro servicio de AWS sin necessidad de acceder a internet.
Ahorra costes al no tener que pasar por internet.

## NAT Gateway (Network adress translation)

Permitir que las instancias conectadas a redes privadas puedan tener acceso a internet.
Se conecta a la subnet publica para que las subnet privadas puedan salir a internet.
Se le associa un Ellastic Ip.
Se incluye en la tabla de rutas default del vpc como destination 0.0.0.0/0 y target la nat gateway.

## VPG (Virtual private gateway), CGWs (Customer gateway) y VPNs (Virtual Private Network)

Para poder conectar un centro de datos existente a aws VPC utilizando conecciones de VPN hardware
o de software.

## Red bastion

Red para acceder desde la red publica a la privada.

## Internet gateway

Permite comunicacion entre instancias en VPC e internet, como si fuera un modem.

## NACL (Network ACL)

Para poner reglas de seguridad inbound y outbound igual que los grupos de seguridad.
Las reglas se recomienda poner Rule como incrementos de 100.

Pueden servir por ejemplo para banear ciertas ips para que no puedan acceder a la red.
Toman preferencia por delante de los grupos de seguridad.

## VPC Flow logs.

Solucionar problemas por los que el trafico especifico no llega a la instancia.
Problemas que los grupos de seguridad las reglas son demasiado resctrictivas.
Crear alarmas para notioficar si se detecta cierto tipo de trafico.

## VPC Peering

Conectar varias vpc entre si. Relacion 1-1 entre 2 vpc.
No tienen relacion transitivia, si A->B>C, A no puede comunicarse con C a partir de B.
Se puede hacer VPC peering entre regiones y puede ser con otra VPC tuya o de otra cuenta.
