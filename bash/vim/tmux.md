# Basic

## Install

```
brew install tmux
```

Todos los comandos se usan con el prefix `Ctrl b`

## Status line

**{name} {window index:window name}- {window index:window name}*    {pane time} {time and date}**

`-`: Last window
`*`: Current window

# Comands con tmux prefix

`C-b ?`: Commands list

## Session

- `tmux`: Create tmux session
- `tmux a -t mysession`: attach session with name mysession
- `C-b $`:  Rename session:
- `C-b d`: Salir de tmux (detach)
- `C-b s`: Show all sessions

### Kill sessions

- `tmux kill-session -a` Delete all sessions but the current
- `tmux kill-session -a -t mysession` Delete all sessions but mysession
- `tmux kill-session -t mysession` Delete session  mysession

## Window

- `C-b c`: Crear window
- `C-b ,`: Rename window
- `C-b &`: Close current window
- `C-b p`: Previous window
- `C-b n`: Next window

# Panes

- `C-b q`: Show pane numbers
- `C-b q n`: Switch to panel of number **n**
- `C-b z`: Toogle zoom
- `C-b x`: Close current pane
