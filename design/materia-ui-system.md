# Material UI

## Material Environment

- Elevation: Shadows, color, opacity, motion
- Scrim: Obscure background to focus attention.
- Properties:
  - Objects can't bypass other objects
  - Farther objects have larger shadow level.


### Shadows

- Level 0: Background, using borders
- Level 1: Panels in rest position
- Level 2: Buttons in rest position
- Level 4: App bar
- Level 6: Fab in res position
- Level 8: Bottom app bar, menus and submenus
- Level 16: Nav drawer
- Level 24: Dialog

Press / hover states:

- Level 8: Button, card
- Level 12: FAB

### Motion

- Increase shadow in hover.
- Increase size:
  - Pushing
  - Scaling
  - Parallax

## Layouts

- Spacing multiple of 8, may use 4 for icons.

### Anatomy

- AppBar
- Navigation
- Body

### Responsive column grid

- Increase columns
- Fix max size for big screens.
- Increase margins left and right for bigger screen sizes.
- Be careful in scale full width elements like buttons, could be over emphasize

**Breakpoints**:

- 0-600: Margin 16, 4 Columns
- 600-904: Margin 32, 8 Columns
- 905-1239: Body 840, 12 Columns
- 1240-1439: Margin 200, 12 Columns
- 1440+: Body 1040, 12 Columns


### Containers

- Touchable elements with minimum 48 x 48 space.
- Aspect ratio for images and panels: 16:9, 3:2, 4:3, 1:1

- Multiples of 8
- Padding 4 may be use in icons.

### Density

- Don't use It for focus tasks or something want to emphasize.
- Easier to scan large lists or tables
- Increase margin without high density containers.
