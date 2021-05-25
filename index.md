# nerdscanner

Inspired in the traditional tree command for linux. Show a recursive
folder tree with the nerdfonts icons, icons for folders, icons, and
use colors for the output.

## Requirements

The requirements list are:

- A very pretty linux distribution
- A nerd font used in your terminal
- A very good and pretty configured terminal
- Python
- Git
- Bash

## Install

To install use the following commands:

```sh
mkdir ~/repo
cd ~/repo
git clone https://github.com/AlphaTechnolog/nerdscanner.git
cd nerdscanner
./install.sh # Please write your password to create folders in /opt and files in /usr/bin
```

## Uninstall

To uninstall use the `uninstall.sh` script:

```sh
cd $NERDSCANNERPATH
./uninstall.sh
```

## Getting started

First create a testdir

```sh
cd $HOME
mkdir -p testdir/dir1 testdir/dir2 testdir/dir3
touch testdir/hello1 testdir/hello2
ln -s $HOME/testdir/dir2 testdir/dir1/dir2
ln -s $HOME/testdir/hello1 testdir/dir2
```

The output with tree is:

```
/home/gabriel/testdir
├── dir1
│   └── dir2 -> /home/gabriel/testdir/dir2
├── dir2
│   └── hello1 -> /home/gabriel/testdir/hello1
├── dir3
├── hello1
└── hello2
```

The output with nerdscanner:

```sh
nerdscanner $HOME/testdir
```
```
 dir1
   dir2
     hello1
 hello2
 hello1
 dir3
 dir2
   hello1
```

the folder color is blue and the file color is green.

## Options

To custom the output pass the next options:

- `-i/--indent-size`: The indent size
- `-I/--ignore`: Ignore a dirname of filename
- `-nr/--no-recursive`: Show's a list of dir content with no recursive method (like ls)
- `-H/--hidden`: Show the hidden files of dir content
- `-NRD/--no-recursive-dir-icon`: The no recursive tree, directory icon
- `-p/--path`: No show the name of dirent, show the path of the dirent.
- `-h/--help`: Show an automatic help log.
- `-F/--file-icon`: The file icon or prefix
- `-D/--dir-icon`: The directory icon or prefix
- `-dc`/`--dir-color`: The directory icon color
- `-fc`/`--file-color`: The file icon color

For more information use: `nerdscanner --help`

### Examples

```sh
nerdscanner $HOME/testdir -i 4 -D "DIR" -F "FILE"
```

```
DIR dir1
    DIR dir2
        FILE hello1
FILE hello2
FILE hello1
DIR dir3
DIR dir2
    FILE hello1
```

```sh
nerdscanner $HOME/testdir -i 2 -dc magenta -fc red
```

```
 dir1
   dir2
     hello1
 hello2
 hello1
 dir3
 dir2
   hello1
```

With the colors changed

```sh
nerdscanner $HOME/testdir -nr
```

```
 dir1
 hello2
 hello1
 dir3
 dir2
```

```sh
mkdir $HOME/other
cd $HOME/other
git init # this create a folder named .git
npm init -y
npm install express morgan body-parser # this create a node_modules folder (like to ignore)
touch .env
echo 'node_modules' >> .env
echo '.env' >> .env
mkdir src
echo 'const express = require("express"); const app = express(); app.listen(8000, () => console.log("Listening on port 8000..."))' >> src/index.js
cd
nerdscanner other -HI node_modules .git
```

```
 .env
 package.json
  src
   index.js
```

```sh
nerdscanner other -HI node_modules .git -nr -NRD "FOLDER (no open)" -F "FILE" -i 4 -dc red -fc blue -p
```

```
FILE other/.env
FILE other/package.json
FOLDER (no open) other/src
```

## Screenshots

![nerdscanner 1](https://user-images.githubusercontent.com/54639968/118077456-18e95f80-b382-11eb-8476-38c0314c5f97.png)
<br>
![nerdscanner 2](https://user-images.githubusercontent.com/54639968/118077472-20106d80-b382-11eb-8841-99aac9116b31.png)
<br>
![nerdscanner 3](https://user-images.githubusercontent.com/54639968/118077523-3dddd280-b382-11eb-92e9-4a170f3ff90c.png)
<br>
![nerdscanner 4](https://user-images.githubusercontent.com/54639968/118077530-4209f000-b382-11eb-8a95-ab3a855585b5.png)
<br>
![nerdscanner 5](https://user-images.githubusercontent.com/54639968/118077540-46360d80-b382-11eb-8944-bca6f1eafe4a.png)






