# Basic

```
tmux attach -t [session_name]   # to start in existing season
tmux new -s [session_name]      # to create session with name
prefix-?                        # Commands list
```

# MOVING

In copy mode, enter with `prefix-[`
```
C-b       # Prev page
D-f       # Next page
g         # Top
G         # Bottom
space     # Start visual mode, select text, then enter to copy
```
Paste text `prefix-]`

# WINDOWS AND PANES

```
prefix-!                             # convert pane to new window
prefix-.                             # Join to this window, pane number*

prefix-c                             # Create window
prefix-,                             # Rename window
prefix-&                             # Close current window
prefix-x                             # Close pane
prefix-p                             # Previous window
prefix-n                             # Next window

prefix-v                             # vertical pane
prefix-h                             # horizontal pane
prefix-|                             # vertical pane same dir, from outside nvim
prefix--                             # horizontal pane same dir, from outside nvim

prefix-z                             # Zoom pane
prefix-space                         # Rotate pane
prefix-{                             # Switch pane
```

# SESSIONS

```
prefix-(         # Prev session
prefix-)         # Next session
prefix-s         # Show all sessions
prefix-.         # Move window to another session. When promp bar, write season name to move
prefix-d         # Detach from session

:kill-session                    # Kill all sessions
:kill-session -a                 # Delete all sessions but current
:kill-session -t [session_name]  # Delete session_name
```

# TMUXINATOR

```
t new [session_name]     # to create a new session config in ~/.config/tmuxinator
t open [session_name]    # to open an existing session config
t [session_name]         # open session
```


# Status line

**{name} {window index:window name}- {window index:window name}*    {pane time} {time and date}**

`-`: Last window
`*`: Current window

