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
