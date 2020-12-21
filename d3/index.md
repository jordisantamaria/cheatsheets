# Crear dataset 

```vue
const dataset = await d3.json("./../../my_weather_data.json")
```

# Crear axis accesors to data

Li marquem a d3 el format de comes les dates en el nostre json.

```vue
const yAccessor = (d) => d.temperatureMax
const dateParser = d3.timeParse("%Y-%m-%d")
const xAccessor = (d) => dateParser(d.date)
```

# Wrapper

Contenidor del svg on estara el grafic

```vue
const wrapper = d3.select("#wrapper")
    .append("svg")
      .attr("width", dimensions.width)
      .attr("height", dimensions.height)
```

# Bounds

Part del svg on estara el grafic, ja que deixarem uns marges.
Pertant la resta del codi treballarem amb els bounds enlloc del wrapper.

```vue
const bounds = wrapper.append("g")
    .style("transform", `translate(${
      dimensions.margin.left
    }px, ${
      dimensions.margin.top
    }px)`)
```

# Scale

Relacio entre el rang de valors entre les dades i el espai del svg on mostrarles.
Amb d3.extent treiem el minim i maxim valor de les nostres dades.

```vue
const yScale = d3.scaleLinear()
  .domain(d3.extent(dataset, yAccessor)) // datos a mostrar
  .range([dimensions.boundedHeight, 0]) // tamaño del grafico en pixels, empezando por top ya que svg empieza a contar de arriba
  console.log(yScale(32))
```

```vue
const xScale = d3.scaleTime()
  .domain(d3.extent(dataset, xAccessor))
  .range([0, dimensions.boundedWidth])
```

# Freezing placement

La zona que volem destacar del grafic, la pintem de color.
```vue
const freezingTemperaturePlacement = yScale(32)
  const freezingTemperatures = bounds.append("rect")
  .attr("x", 0)
  .attr("width", dimensions.boundedWidth)
  .attr("y", freezingTemperaturePlacement)
  .attr("height", dimensions.boundedHeight
  - freezingTemperaturePlacement)
  .attr("fill", "#e0f3f3")
```

# Mostrar les dades del grafic

Les dades les mostrem en el path del svg.

Per a mostrar un grafic linia, cridem d3.line() i l'afegim al path

```vue
const lineGenerator = d3.line()
  .x(d => xScale(xAccessor(d)))
  .y(d => yScale(yAccessor(d)))

  const line = bounds.append("path")
    .attr("d", lineGenerator(dataset))
    .attr("fill", "none")
    .attr("stroke", "#af9358")
    .attr("stroke-width", 2)
```

# Print axis

Per a generar el axis, cridem a d3.axisLeft/Top/Bottom/Top segons la posicio,
relacionantlo amb les dades de scale i ho afegim al svg.

```vue
const yAxisGenerator = d3.axisLeft()
  .scale(yScale)

  const yAxis = bounds.append("g")
  .call(yAxisGenerator)

  const xAxisGenerator = d3.axisBottom()
  .scale(xScale)

  const xAxis = bounds.append("g")
    .call(xAxisGenerator)
      .style("transform", `translateY(${
      dimensions.boundedHeight
      }px)`)
```

# Chart Types

scatterplot (graf de punts): Bona opcio per a mostrar relacio entre 2 metricas.

.nice() redondea los valores y les da margenes, para que no se queden pegado a los bordes.

## Draw data

Para dibujar un circle en svg:
cx = center of the circle x
cy = center of the circle y
r = radius

```vue
bounds.append("circle")
  .attr("cx", dimensions.boundedWidth / 2)
  .attr("cy", dimensions.boundedHeight / 2)
  .attr("r", 5)
```

D3 proporciona metodos para dibujarlo, lo que nos permite controlar el estado
de los puntos que ya existen y nuevos puntos que queramos incorporar:

1. con selectAll() cogemos los puntos que estaban dibujados anteriormente
2. con .data() cogemos los elementos a añadir nuevos
3. con enter() nos referimos solo a los datos nuevos que van a entrar
4. con merge() juntamos los datos que habian antes al conjunto de los datos nuevos que entran
5. con .append("circle") creamos un circle por cada dato
6. Le damos valores al circle para que se muestre el punto.
   
Nos devuelve 3 arrays con los siguientes valores:

- enter: Nuevos a añadir
- exit: Los que existian que se van
- groups: Interseccion entre enter y exit, los valores resultantes

```vue
function drawDots(dataset, color) {
  const dots = bounds.selectAll("circle").data(dataset)

  dots
    .enter().append("circle")
    .merge(dots)
      .attr("cx", d => xScale(xAccessor(d)))
      .attr("cy", d => yScale(yAccessor(d)))
      .attr("r", 5)
      .attr("fill", color)
}
```

## Shortcut con .join()

Con .join() llamamos a .enter(), .append(), .merge() y otros comandos extras.
Por lo que quedaria asi:

```vue
function drawDots(dataset, color) {
  const dots = bounds.selectAll("circle").data(dataset)

  dots.join("circle")
    .attr("cx", d => xScale(xAccessor(d)))
    .attr("cy", d => yScale(yAccessor(d)))
    .attr("r", 5)
    .attr("fill", color)
}
```

## Incluir labels en los axis

Para incluir texto en svg, usamos <text> con pos x, y.
```vue
const xAxisLabel = xAxis.append("text")
    .attr("x", dimensions.boundedWidth / 2)
    .attr("y", dimensions.margin.bottom - 10)
    .attr("fill", "black")
    .style("font-size", "1.4em")
    .html("Dew point (°F)")
```

## Definir la cantidad de intervalos del eje

Usamos ticks, no tiene porque ser exactamente lo que ponemos, si no es una sugestion y D3
intentara adaptarse a unos intervalos amigables.

```vue
const yAxisGenerator = d3.axisLeft()
  .scale(yScale)
  .ticks(4)
```
