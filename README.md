Awesome-3.5
==================

Awesome Configs updated to 3.5

All the Extra widgets that were custom written have now been moved to ./widgets

Vicious widgets are still where they are supposed to be.

Though you will still need to add these to wi.lua yourself if you intend on using the widgets in ./widgets

---

To use this config it needs to be placed in $HOME/.config/awesome the easiest way to do this is:

	git clone https://github.com/samdfonseca/awesome.git $HOME/.config/awesome

The config should be pretty Self explanitory though if you have issues please post an issue.

All of the Widgets config is in wi.lua to try to make rc.lua more manageable by default this config is setup for a laptop.

To Use the config for a Desktop you can simply edit rc.lua and comment out the battery widgets in the wibox section (or any other widgets you dont want)

---

I have Added some default wallpapers thanks to Nasa and the Hubble Space Telescope and removed the broken symlink for bg.png.

Once you have Cloned the repo and are running this config for the first time you will se in the awesome menu a walpapers list you can select any of the wallpapers from there the awesome config will handle the rest, Awesome will restart every wallpaper change this is normal behaviour if you want your own images to show up in the list then copy them to,
	
	$HOME/.config/awesome/wallpapers/ 
	
and restart Awesome you can then select them from the drop down list.

