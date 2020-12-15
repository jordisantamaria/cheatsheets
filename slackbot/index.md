# Mostrar la app en el workspace

Sidebar: Features -> App Home

1. Home tab
2. Messages tab

# Subscriures a events de slack

Interactuar a events de slack com channel_created, channel_join, etc...
https://api.slack.com/events

Sidebar: Event Subscription -> Enable events

## Request url

Endpoint donde la api de slack te envia los eventos a los que te subscribes.
Por defecto slack envia los eventos al endpoint: **/slack/events**

Ejemplo, request url =
```
https://bolt-app-template.glitch.me/slack/events
```

## Subscriures el event

Seleccionar els events en les seccions de Subscribe to bot events o Subscribe to events on behald of users

Amb aixo donem permis a poder escoltar als events que seleccionem.

# Escoltar events en el endpoint

```
app.event('app_home_opened', async ({ event, client, context }) => {}
```

# Authentication

Sidebar: Features/Oauth & Permissions

## Scopes

Els scopes serveixen per donar permisos a la aplicació per poder cridar a funcions de la api de slack.

Els scopes disponibles son: https://api.slack.com/scopes

### Bot token Scope

En general els permisos es solen posar aqui.

### User token Scope

Es la excepció, casos dus:

1. Si necessites actuar com un usuari especific: Enviar un missatge com a un usuari especific.
2. Si necessits access a RTM https://api.slack.com/rtm

# Install App

Un cop hem definit algun scope, la app es instalable en:

Sidebar: Settings/Install App

Al instalar la app, et genera un acces token que et permet accedir els api methods definits en
els scopes.

# Distribuir app a multiples workspaces

Per a poder instalar la app en multiples workspaces, es te que
activar el mode Public Distribution.

## Redirect Url

Per a activar el mode, es necessari authoritzacio via auth0.
Un cop authoritzat, redirigira el usuari al redirect url on
s'obtindra el codi com a querystring parameter per a poder
cridar el api per tenir access a instalar la aplicacio.

```
const code = event.queryStringParameters.code;
const oauthURL = "https://slack.com/api/oauth.v2.access?" +
        'client_id=' + clientId + '&' +
        'client_secret=' + clientSecret + '&' +
        'code=' + code;
await fetch(oauthURL, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
})
```

## Add to Slack button

Un cop tenim el redirect URL configurat, podem activar el
Public Distribution, lo que s'ens habilitara un
butto "Add to slack", el qual ens permetra instalar la app
en un altre workspace.
