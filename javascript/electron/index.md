# Electron

A chromium wrapper to create desktop windows and mac native apps with javascript.

## Main process

- app object, control app lifecycle with app.on('event')
- create windows.
- Include preload scripts: Scripts executed before execute website, It have more permissions.

## Renderer process

- BrowserWindow: Render an html file inside a desktop app window.

## Build production source

- Electron forge: creates .exe file.
