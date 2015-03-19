# zz
simple directory jumper based on bookmarks created with zzify

## Usage

### create bookmarks to jump to

In any directory, execute
```
zzify stonehenge
```
to create a link to this location with the mnemomic `stonehenge`. Avoid calling `zzify` without arguments as it will insult you very badly. You can also create a link to a different location by calling
```
zzify capeofgoodhood /home/your-awesome-name-here/cool-stuff
```
Calling `zzify` to a symbolic name that is already in use will overwrite the old location. Be very careful as it won't ask you whether you really meant what you were typing. At the end of the day, you want to be treated as a grown-up person, don't you do? I know you do, right?
Oh, and if you feel you really need to, you can also delete existing jump marks by issuing
```
zzify --delete acropolis
```
Well, to be exact, it actually does not need to exist. Whatever, after that command it's gone, I promise. If for some reason you need to just throw away all your bookmarks (did you use sensitive data the NSA wants to have for your mnemomics?), there's also a command for that. But I won't tell you since this is really hard stuff. `*`

### actually jump to those

Now let's have some fun. Whereever you are, execute
```
zz lochness
```
to get to the remembered directory. No more waiting, just instantanous delivery. You most certainly will love it. And if you can't remember those stupid names you gave to your directories, `zz` does. Just give a call to
```
zz
```
to get a list of all your bookmarks and their target directories. And the list is even formatted nicely. That's almost as good as Christmas, isn't it?
Now go and use it for your work.

## How does it work?

zz creates and maintains the `~/.zz` file in your home directory. That's where it stores your bookmarks and their corresponding paths. The rest is some black shell magic.

No, actually it's an extremely easy script. Just look at the code, you will most certainly understand it.

## License

Created and copyright 2015 by Johannes Lauinger
Released just for you under the terms of the GNU General Public License, Version 3

Go ahead and modify it. It would be awkward if you I both had the exact same working style and this script would fit you perfectly, wouldn't it? If you do something awesome with it, you can submit a pull request, too.

----
`*`: it is `zzify --i-fucked-up-start-over-again --really`
