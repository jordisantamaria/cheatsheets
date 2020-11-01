#Vue basics

https://www.newline.co/books/fullstack-vue/how_to_get_the_most_book

# Js in html

## Use variables in text
```vue
 div {{ message }}
``` 

## bind variables in tag properties

v-bind:title |  :title

```vue
<span v-bind:title="message">
    Hover your mouse over me for a few seconds
    to see my dynamically bound title!
</span>
```

## Conditionals directives
```
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```

### v-show

Para hacer toogle de la property display: none

## Bucle
```
<ul id="example-1">
  <li v-for="item in items" :key="item.message">
    {{ item.message }}
  </li>
</ul>
```

## Key

Vue intenta reutilizar los componentes cuando se usa v-if o v-for, asi que para
mantener el estado correctamente, es necesario darle una key unica a cada elemento.
```vue
<template v-if="loginType === 'username'">
  <label>Username</label>
  <input placeholder="Enter your username" key="username-input">
</template>
<template v-else>
  <label>Email</label>
  <input placeholder="Enter your email address" key="email-input">
</template>
```

## Events

- v-on:click | @click 
```vue
<button v-on:click="reverseMessage">Reverse Message</button>
```

### Conditional class css

```vue
private isActive = true

<div v-bind:class="{ active: isActive }"></div>

```
With a list of conditional classes
```vue
<div v-bind:class="[isActive ? activeClass : '', errorClass]"></div>
```

# Keep variable state updated to state

## Computed with getter

Si se actualiza firstname o lastname, se actualiza automaticamente name
```vue
private firstName = "Jordi";
private lastName = "Santamaria"

get name() {
  return this.firstName + this.lastName;
}
```

## Watch

Para reaccionar cuando cambia el estado de una variable.

```vue
@Watch('tableDate')
onChange() {
    summaryTableModule.fetchSummaryTable(this.tableDate);
}
```


# Life cycle

- beforeCreate

- created

- beforeMount

- mounted

- beforeUpdate

- updated

- beforeDestroy

-destroyed

# Directives

## Directives arguments

- v-bind:href -> href is an argument

# Props

# Design patterns

# Tests

# Formularies

- two-way binding:
```
v-model
```

#vue-router

##Basic

Con el setup, nos da acceso a **this.$router** y **this.$route** en los componentes.

```javascript
const routes = [
  { path: '/foo', component: Foo },
  { path: '/bar', component: Bar }
]

const router = new VueRouter({
  routes // short for `routes: routes`
})

const router = new VueRouter({
  routes // short for `routes: routes`
})
```

## Named routes

En vez de hacer el routing por el slug, se puede hacer por name,
es lo recomendado.

```javascript
const routes: Array<RouteConfig> = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/about/:id",
    name: "About",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue")
  }
];

<router-link :to="{ name: 'Home'}">Home</router-link> |
<router-link :to="{ name: 'About'}" >About</router-link>
```

## Dynamic routes

```javascript
const router = new VueRouter({
  routes: [
    // dynamic segments start with a colon
    { path: '/user/:id', component: User }
  ]
})

<router-link :to="{ name: 'About', params: { id: 4 }}" >About</router-link>

// comp.vue
const id = this.$route.params.id
```

### Re-render when router params change
```vue
<router-view :key="$route.path" />
```

### Params as props
Definir props: true en la ruta
```vue
const routes: Array<RouteConfig> = [
  {
    path: "/about/:id",
    name: "About",
    props: true,
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue")
  }
];
```
Definir la prop en el comp:
```vue
@Prop() private id!: number;
```

## Active link

Definido por defecto como
```css
a.router-link-exact-active {
  color: red;
}
```
Se puede modificar en el router
```javascript
new Router({
  linkExactActiveClass: 'link-active'
})
```

## Mode history, remove # from route

Por defecto la ruta tiene el # asi: http://localhost:8080/#/

Para solucionarlo:
```vue
const router = new VueRouter({
  mode: "history",
  routes
});
```

## Nested routes:

Incluir en las rutas el children
```vue
{
      path: "/destination/:slug",
      name: "DestinationDetails",
      props: true,
      component: () =>
        import(/* webpackChunkName: "DestinationDetails"*/ "./views/DestinationDetails"),
      children: [
        {
          path: ":experienceSlug",
          name: "experienceDetails",
          props: true,
          component: () =>
            import(/*webpackChunkName: "ExperienceDetails"*/ "./views/ExperienceDetails")
        }
      ]
    },
```

Y donde tiene que mostrarse la ruta nested
```vue
<router-view :key="$route.path" />
```
