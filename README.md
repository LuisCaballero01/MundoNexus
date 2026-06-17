# Estructura de archivos obligatoria

- Archivo `ciudadanos.wlk`
- Archivo `centros.wlk`
- Archivo `federacion.wlk`
- Archivo `nexusTest.wtest`

## MUNDO NEXUS

En una era de ciudades flotantes interconectadas por redes cuánticas, una federación global ha decidido desarrollar un sistema que modele los centros urbanos y los ciudadanos que viven en ellos.

### Los Centros Urbanos

Los centros urbanos registran dos características principales: su capacidad máxima, que es el número máximo de ciudadanos que pueden alojarse, y su índice de innovación, que refleja su grado de desarrollo tecnológico. Los centros pueden incorporar nuevos ciudadanos siempre que no se supere su capacidad máxima. Si se quiere agregar un ciudadano y se excede la capacidad máxima, debe producirse el error "Supera la cantidad máxima permitida".

Cada centro urbano tiene la capacidad de responder lo siguiente:

- **Comunidad destacada**: son los ciudadanos notables del centro.
- **Nivel inicial de protección**: es la cantidad de ciudadanos que tienen al menos una potencia mínima definida por la federación, establecida inicialmente en 20 unidades. Este valor es común para todos los centros y puede ser configurado según sea necesario.
- **Centro de élite**: un centro se considera de élite si su índice de innovación es superior a 5 y todos los ciudadanos tienen al menos 12 unidades de habilidad.
- **Capacidad efectiva de protección**: la suma de la potencia de la comunidad destacada.

### Ciudadanos
De cada ciudadano se registra su edad y además se debe poder obtener:
- la potencia,
- la habilidad para resolver situaciones,
- si es o no notable.

El valor base de la potencia es de 20 para todos los ciudadanos en general, pero algunos tipos de ciudadanos pueden informar un valor mayor dependiendo de la definición que se indica más abajo.

La habilidad es de:

- 15 para quienes tienen entre 20 y 40 años.
- 10 para quienes están fuera de ese rango.

La condición común para que un ciudadano sea notable es que tenga entre 25 y 35 años de edad, inclusive.

Existen por ahora 2 diferentes tipos de ciudadanos:

#### Ingenieros

Son los responsables de mantener la infraestructura del centro y registran su nivel de especialización, que comienza en 5 puntos.

Su habilidad se calcula como el valor general más el triple de su nivel de especialización.

Un ingeniero es notable si además de la condición común, su nivel de especialización es superior a 8.

Los ingenieros se perfeccionan e incrementan su nivel de especialización en 2 puntos en cada capacitación, pero también sufren 1 flasheo y pierden 1 punto de especialización solamente si no son notables.

#### Guardianes

Son los responsables de proteger los centros urbanos.

Tienen una reserva operativa que inicia en 100 y su potencia se calcula como el valor general (potencia base) más el 10% de dicha reserva.

Un guardián es notable si además de la condición común, su potencia supera las 50 unidades o su reserva operativa es mayor a 150.

Los guardianes entrenan e incrementan la reserva operativa en 10 unidades por cada sesión, y dicho valor nunca puede superar las 300 unidades.

También realizan patrullajes, lo que reduce la reserva operativa en:

- 20 unidades si la habilidad es par.
- 18 unidades si la habilidad es impar.

La reserva operativa nunca puede ser negativa.

## Validaciones Iniciales (Test obligatorios parte 1)

Considere el centro urbano **Aurora Prime** con una capacidad máxima para 5 ciudadanos y un índice de innovación de 6 unidades donde actualmente viven los siguientes ciudadanos:

- **Atlas**: un ingeniero de 50 años.
- **Sigma**: una ingeniera de 28 años con un nivel de especialización de 6.
- **Echo**: una ingeniera de 35 años con un nivel de especialización de 9.
- **Sentinel**: una guardiana de 22 años con una reserva operativa de 120.
- **Aegis**: un guardián de 35 años con una reserva operativa de 180.

Verifique lo siguiente:

- Que la comunidad destacada de Aurora Prime está conformada por Echo y Aegis.
- Cambiar la potencia mínima definida por la federación a un valor de 30 y verificar que el nivel inicial de protección del centro es de 2.
- Verificar que auraPrime es de Élite.
- Verificar que la capacidad efectiva de protección es de 58.
- Capacitar 2 veces seguidas a Sigma y controlar que ahora la capacidad efectiva de protección es 78.
- Intentar agregar otro ciudadano cualquiera a Aurora Prime y verificar que se produce el error indicado. Para realizar este test usar el mensaje `throwsExceptionWithMessage` al objeto assert. Ejemplo:
  - `assert.throwsExceptionWithMessage("mensaje de la excepción", {bloque con el mensaje que debe arrojar excepción, va entre llaves})`

## Más sobre los Centros Urbanos

Adicionalmente, los centros urbanos tienen la posibilidad de solicitar contribuciones a todos sus ciudadanos (siempre que tenga al menos 1). Cuando esta condición se cumple, se aumenta la capacidad máxima del centro en una unidad. Con respecto a los ciudadanos, aquellos que tengan una edad mayor a 65 años, luego de realizar su contribución se retiran y abandonan definitivamente el centro. Dependiendo del tipo de ciudadano que sea, pasa lo siguiente:

- **Ingenieros**: le aumentan al centro el índice de innovación en 1 unidad por cada 4 puntos de especialización que posee cada ingeniero. Después de realizar su contribución, al ingeniero le produce 1 flasheo.
- **Guardianes**: no realizan ninguna contribución, ya que su función principal es proteger el centro.

## Federación Global

La federación global es la encargada de gestionar todos los centros urbanos y tiene la capacidad de crear nuevos.

Un nuevo centro urbano siempre se crea con:

- un índice de innovación inicial de 5 unidades,
- una capacidad máxima igual a la cantidad de centros existentes (si no hay ninguno, es decir, es el primer centro de la federación, se crea con 3),
- y se puebla con el ciudadano más joven de cada centro, y en caso que sea el primer centro, se asigna un ingeniero de 25 años.

Es importante señalar que los ciudadanos jóvenes reasignados al crear el nuevo centro deben abandonar sus centros anteriores.

## Validación Final (Test parte 2)

Considere una federación que posee los siguientes centros urbanos:

**Neo Tokyo** con capacidad máxima 5 e índice de innovación 6, habitado por:

- Orion: un ingeniero de 50 años.
- Nova: una ingeniera de 20 años.

**Skyline One** con capacidad máxima 3 e índice de innovación 5, habitado por:

- Titan: un guardián de 40 años.
- Vega: una guardiana de 22 años.

Solicitar a la federación la creación de un nuevo centro urbano "Elysium Core" y verificar que:

- El nuevo centro tiene un índice de innovación inicial de 5 unidades.
- Su capacidad máxima es igual a 3, porque la cantidad de centros existentes previamente es 2 y 3 es el valor mínimo para nuevos centros.
- El nuevo centro queda poblado por Nova y Vega, por ser los ciudadanos más jóvenes de cada centro.
- Nova deja de pertenecer a Neo Tokyo.
- Vega deja de pertenecer a Skyline One.
