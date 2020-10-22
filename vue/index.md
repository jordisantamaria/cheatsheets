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
