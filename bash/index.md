# Basic

```
man [command]        # command documentation
~                    # Home dir, Alt ñ
pwd                  # Print working directory
tree                 # Print folders structure as tree
ls                   # List current directory content
cd [path]            # Move to new path
```

# Move, copy, rename

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
cat [fileName] | sort [text]   # Return lines sorted
cat [fileName] | uniq [text]   # Return unique lines
```
