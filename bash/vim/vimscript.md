Mappings
===============================================================================

```
vnoremap
nnoremap
inoremap
onoremap           # For define objects "operator pending"
```


Normal | Execute
===============================================================================

## Normal

Execute characters actions would do in normal mode. Recommended always use
as normal!

```
:normal! gg
```

## Execute

Takes a Vimscript string and performs it as a command.

```
:execute "normal! gg"
```

The problem of normal is, don't recognize **special characters** like `<cr>`.

Execute will substitute any special character before running, for example
`\r` to carriage return.

To see special characters available `:help expr-quote`


Command line mode
===============================================================================

```
<cword>         # Word in cursor, echo expand("<cword>")
<cWORD>         # WORD in cursor
silent          # Hide any return message from commands
```


