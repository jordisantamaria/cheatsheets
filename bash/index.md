# Basic

```
man [command]        # command documentation
~                    # Home dir, Alt ñ
pwd                  # Print working directory
tree                 # Print folders structure as tree
ls                   # List current directory content
cd [path]            # Move to new path
```

# Move, copy, rename, create files

```
mv [filePath] [newFilePath]      # Move to new path, rename file if path dir is same
cp [filePath] [newFilePath]      # Remove from origin and move to new file path
cp -r [filePath] [newFilePath]   # Copy directory
rm [filePath]                    # Remove a file
rm -rd [filePath]                # Remove a directory
mkdir [file]                     # Create directory
mkdir -p [file]                  # Create directory and It's parents
touch [file]                     # Create file
```

# Read | open file

```
open [fileName]                # Open file with default OS program
open -a [program] [fileName]   # Open file with specific program
more [fileName]                # Open file like man, showing start and scrolling It
head {-n}                      # Open first n lines, 10 as default
tail {-n}                      # Open last n lines, 10 as default
cat [fileName]                 # Show file content
```

# Standard Input | Output

```
[input] > [output]       # Move input to output
[input] >> [output]      # Append input at end of Output file
[output] | [command]     # Move output as a input for a command, example to grep
```

## Example pipes usage

```
cat [fileName] | grep [text]   # Return lines having [text] of file
cat [fileName] | sort          # Return lines sorted
cat [fileName] | uniq          # Return unique lines
```

# JSON output with jq

```
aws secretsmanager get-secret-value --secret-id [secret-name] | jq '. | .SecretString' | jq . -r | jq . --tab
```


Terminal
===============================================================================

```
cdf                           # Change to finder directory
ofd                           # Open finder with current directory

alias                         # List all terminal alias
alias | grep 'regex'          # Filter alias

alt-c                         # Fuzy find directorys
C-t                           # Fuzy find file & directorys
C-r                           # Fuzy find command history

Esc Esc                       # Sudo command, or last command If empty command.

d                             # Last used directorys list
[n]                           # Press a number to jump to a directory list with d

C-a                           # Move to start of line
C-e                           # Move to end of line
C-u                           # Remove line
C-w                           # Remove word

neofetch                      # OS Info

sudo ss -lptn 'sport = :5432' # find pid using port 5432
kill pid                      # stop service using pid
```

## Jira

```
jira                # My issues
jira branch         # Current issue of git branch
jira new            # To create new issue
```

## Yarn

```
y               # yarn install
ya              # yarn add
yad             # yarn add -D
yb              # yarn build
ys              # yarn serve
yt              # yarn test
```

## Docker-compose

```
dcdn              # docker-compose down
dce               # docker-compose exec
dcl               # docker-compose logs
dclf              # docker-compose logs
dco               # docker-compose
dcps              # docker-compose ps
dcstop            # docker-compose stop
dcup              # docker-compose up
dcupb             # docker-compose up --build
dcupd             # docker-compose up -d
```

Apache
==============================================================================

```
/etc/init.d/apache2 stop    # stop apache
/etc/init.d/apache2 start   # start apache
```

Kitty
===============================================================================

Kitty_mod = `shift+ctrl`
```
kitty_mod-e              # Open url
kitty icat image.jpg     # Open image
```

Qutebrowser
===============================================================================

```
o              # Open
O              # Open in new tab
f              # Open link
             
H              # History back
L              # History forward
             
;d             # Download

space          # Scroll 100% screen

[[             # Next page (pagination)
]]             # Last page

:devtools      # Toogle devtools window
```

## Tabs

```
J              # Right tab
K              # Left tab
T              # First
alt-[n]        # n tab
               
d              # Close tab
u              # Undo close tab
gC             # Clone tab
g[J|k]         # Change tab order
```

## Copy url

```
yy       # Current page
;y       # From links
```

## Copy text from page

1. Find text with `/`
2. Go caret mode `v`
3. Select text, move by line as vim with `w|b|e|hjkl`
4. Yank text with `y`

## Zoom

```
+
-
=
```

## Navigation Same as vim

```
/
?
n
N

gg
G

hjkl

C-f
C-d

C-b
C-u

```

SED
===============================================================================

For replace text.

```
echo "hello world" | sed 's/world/jordi/'        # Hello jordi
```

