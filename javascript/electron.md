Communicate renderer to main

1. 1 way renderer to main


```
# react
ipcRenderer.send()
```

```
# electron
ipcMain.on()
```

2. 2 way renderer to main

```
# react
const response = ipcRenderer.invoke()
```

```
# electron
ipcMain.handler()
```


# Audio context

To produce sound, create sound sources and connect them.

##Methods

```
AudioContext.createMediaStreamSource()  // create MediaStream with audio stream from computer, mic or other sources.

```