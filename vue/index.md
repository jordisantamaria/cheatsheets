# Setup project with vue, vuetify, ts and pug

```
vue create project-name
vue add vuetify
vue add pug
```

# Best practices

TODO

# Js in html

## Use variables in text
```vue
 div {{ message }}
``` 

## Props

### Parent to children

v-bind:title |  :title

```vue
<span v-bind:title="message">
    Hover your mouse over me for a few seconds
    to see my dynamically bound title!
</span>
```

### Children to parent

Para que el padre se entere de los cambios del hijo, se emiten
eventos a los cual el padre puede escuchar.

```
children:  $emit(nameOfEvent)

parent: $on(nameOfEvent)
```

### Sharing props between any component

Amb eventBus podem tenir un estat global compartit.
Aunque com es dificil de gestionar estats complexos,
es recomanat no ferlo servir i fer servir vuex.

```
export const EventBus = new Vue();

monitorEnterKey() {
  EventBus.$emit('add-note', {
    note: this.input,
    timestamp: new Date().toLocaleString()
  });
  this.input = '';
}

created() {
    EventBus.$on('add-note', event => this.noteCount++);
}
```

### VUEX

Structure:

- Action: Post data -> Mutation

- Mutation: Update state

- Getter: Return part of state

- Use state in components


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

Other events: click, dblclick, drag, drop, mousedown, mouseenter, mouseleave, mousemove, mouseout, mouseover, mouseup

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

- created: Inicialitzacio de variables

- mounted

- updated: Quan s'ha actualitzat alguna prop i es 
fa rerender.

- destroy

# Directives

## Directives arguments

- v-bind:href -> href is an argument

# Formularies

- two-way binding:
```
v-model
```

- value / @input

## Fields

```
private fields = {
    newItem: '',
    email: '',
    urgency: '',
    termsAndConditions: false
}

<div class="field">
          <label>New Item</label>
          <input v-model="fields.newItem" type="text"
            placeholder="Add an item!" />
        </div>
        <div class="field">
          <label>Email</label>
          <input v-model="fields.email" type="text"
            placeholder="What's your email?" />
        </div>
```

## Form Validation

```
private fieldErrors = {
    newItem: undefined,
    email: undefined,
    urgency: undefined,
    termsAndConditions: undefined
}
private loading =  false
private saveStatus = 'READY' // 'SAVING', 'ERROR', 'SUCCESS'

validateForm(fields) {
  const errors = {};
  if (!this.$store.state.fields.newItem) {
    errors.newItem = "New Item Required";
  }
  if (!this.$store.state.fields.email) {
    errors.email = "Email Required";
  }
  if (!this.$store.state.fields.urgency) {
    errors.urgency = "Urgency Required";
  }
  if (!this.$store.state.fields.termsAndConditions) {
    errors.termsAndConditions = "Terms and conditions have to be approved";
  }

  if (this.$store.state.fields.email &&
    !this.isEmail(this.$store.state.fields.email)) {
    errors.email = "Invalid Email";
  }

  return errors;
},
```

## Field validation

With computed variables.

```
computed: {
    isNewItemInputLimitExceeded() {
      return this.fields.newItem.length >= 20;
    },
    isNotUrgent() {
      return this.fields.urgency === 'Nonessential';
    }
}
```

## Submit form:

```
<form @submit="submitForm" class="ui form">

submitForm(evt) {
  evt.preventDefault();

  this.fieldErrors = this.validateForm(this.$store.state.fields);
  if (Object.keys(this.fieldErrors).length) return;

  const items = [
    ...this.$store.state.items,
    this.$store.state.fields.newItem
  ];

  this.saveStatus = 'SAVING';

  this.$store.dispatch('saveItems', items)
    .then(() => {
      this.saveStatus = 'SUCCESS';
    })
    .catch((err) => {
      console.log(err);
      this.saveStatus = 'ERROR';
    });
}
```
## Submit button state

```
<button v-if="saveStatus === 'SAVING'"
  disabled class="ui button">
  Saving...
</button>
<button v-if="saveStatus === 'SUCCESS'"
  :disabled="isNewItemInputLimitExceeded || isNotUrgent"
  class="ui button">
  Saved! Submit another
</button>
<button v-if="saveStatus === 'ERROR'"
  :disabled="isNewItemInputLimitExceeded || isNotUrgent"
  class="ui button">
  Save Failed - Retry?
</button>
<button v-if="saveStatus === 'READY'"
  :disabled="isNewItemInputLimitExceeded || isNotUrgent"
  class="ui button">
  Submit
</button>
```

## Form state with Vuex

Use value / @input instead of v-model

When input is updated, commit MUTATION to store.

```
<input :value="newItem" @input="onInputChange"
    name="NEW_ITEM" type="text" placeholder="Add an item!" />

newItem = this.$store.state.fields.newItem

onInputChange(evt) {
  const element = evt.target;
  const value =
    element.name === "TERMS_AND_CONDITIONS"
      ? element.checked
      : element.value;
  this.$store.commit(`UPDATE_${element.name}`, value);
}
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

# Unit testing

## Setup

### Install librarys

```
yarn add -D @testing-library/vue
yarn add -D @testing-library/jest-dom
```

### Jest config options

Vue cli fa servir el seu propi jest.config.js amb tota la
configuracio necessaria per poder testear.

Si volem configuracio extra, tenim que posarla en el package.json,
enlloc de crear un jest.config.js per a no perdre la config.

https://jestjs.io/docs/en/webpack

#### moduleNameMapper:

Jest no pot llegir imports de fitxers que no siguin .ts o .js
Si es un altre tipus com .css o .yaml, fer que en el seu lloc importi un fitxer de mock

#### setupFiles

Abans de tirar els testos, configurar el entorn important dependencies pels testos.

Exemple: "jest-init.ts"

```
import { ValidationObserver, ValidationProvider } from 'vee-validate';
import Vue from 'vue';
import '../../src/plugins/vee-validate';

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);
```


```
"jest": {
    "preset": "@vue/cli-plugin-unit-jest/presets/typescript-and-babel",
    "moduleNameMapper": {
      "\\.yaml$": "<rootDir>/tests/setup/empty-mock.js"
    },
    "setupFiles": [
      "<rootDir>/tests/setup/jest-init.ts"
    ],
},
  ```

### Ve-validate

Ve-validate necessita fer cambis en el jest config del package.
https://vee-validate.logaretm.com/v3/advanced/testing.html#asynchronous-testing

```
"transform": {
    "vee-validate/dist/rules": "babel-jest"
},
"transformIgnorePatterns": [
  "<rootDir>/node_modules/(?!vee-validate/dist/rules)"
]
```

### Custom render method

Al renderitzar el component, necessitem configurar les dependencies com i18n, vuex, routes, etc..
Per a aixo creem un custom render del que fem servir enlloc del render generic.

```
export const renderComponent = (Component: any, options?: any) => {
    return render(
        Component,
        {
            routes: [],
            ...vuetifyOptions,
            ...options,
        },
        (vue) => {
            // Let's register and configure Vuei18n normally
            vue.use(VueI18n);
            return {
                i18n,
            };
        },
    );
};
```

## Example Testing component:

```ts
import { render } from '@testing-library/vue';
import BtnSubmit from '@/components/Ui/Input/BtnSubmit.vue';

describe('Btn Submit', () => {
    it('Is saved', async () => {
        const { getByText, updateProps } = render(BtnSubmit, {
            props: {
                isSaved: false,
                label: "Save",
                labelSaved: "Saved"
            }
        })
        getByText("Save")
        await updateProps({isSaved: true})
        getByText('Saved')
    });
});
```

## API

### Render

Al hacer render(), nos devuelve un objeto con funciones utils
para testear.

```
const {debug, getByText, getByLabelTest, etc...} = render(Component)
```

html() => Devuelve el html del render

```
expect(html()).toBe('<div><p>Foo</p></div>')
```

emitted() => Comprobar que se ha emitido un evento

```
await fireEvent.click(btn)
expect(emitted().click).toBeTruthy()
```

### Fire event

Para lanzar eventos de dom

```
await fireEvent.click(getByText('Click me'))
await fireEvent.touch(getByLabelText('username'))
await fireEvent.focus(getByLabelText('username'))
await fireEvent.blur(getByLabelText('username'))
```

#### Validando input change con fireEvent.update()

Update input text:

Necessitamos flushPromises para esperar a que el dom se actualice y
el componente tambien se actualice para validar el input

```
import flushPromises from 'flush-promises';

const usernameInput = getByLabelText(/username/i);
await fireEvent.update(usernameInput, 'hello');
await flushPromises();
getByText('validation.username');
```


## Design patterns with vue



