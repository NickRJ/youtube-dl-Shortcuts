# youtube-dl-Shortcuts
Quickly select youtube-dl formats. Adds flags --1080, --720, --480 and more.

Download a 1080p video:

```
y --1080 [url]
``` 
 
vs 
 
```
youtube-dl -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" [url]
```


## Usage
```
usage: y [-h]
         [--2160 | --1440 | --1080 | --720 | --480 | --360 | --240 | --144 | --best]
         [--live]

optional arguments:
  -h, --help       Print this help text and exit
  --live           Display input after each download

optional formats:
  --2160, --2160p
  --1440, --1440p
  --1080, --1080p
  --720, --720p
  --480, --480p
  --360, --360p
  --240, --240p
  --144, --144p
  --best           Best format as single file
  ```
  This is simply a python wrapper for youtube-dl. All other flags are passed to the main program.
    
  ## Installation
  
  Download the script and create a [custom terminal command](https://askubuntu.com/questions/118312/how-can-i-create-a-custom-terminal-command-to-run-a-script).
  
  ### How?
  
  Create a `.bin` directory in your home directory if it doesn't exist: `mkdir ~/.bin`
  
  Move the script there: `mv y ~/.bin`
  
  Add execute permissions to the script: `chmod 744 ~/.bin/y`

  Update PATH variable in `~/.bashrc` or `~/.zshrc` (if on macOS): `export PATH=$PATH:~/.bin`
 
  ### Enjoy!
