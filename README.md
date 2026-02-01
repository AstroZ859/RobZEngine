# Friday Night Funkin': RobZ Engine
 No description available yet.
 > [!NOTE]
 > Remember to check import.hx before importing a class that is already imported there
 > 
 > [You can also join our Discord server for updates and announcements, just click here](https://discord.gg/NynuH8DTEk)

## RobZ Engine Team
 -**RobZ** (Creator, Programmer)
 
 -**Gianfranco Xankin** (Artist)

## Special Thanks
 -**Realistic Engine** (Inspiration / Friend's Engine)
 
 -**Codename Engine** (Inspiration)

## Build Instructions (Windows)
 > [!WARNING]
 > THIS ENGINE IS CURRENTLY ONLY AVAILABLE FOR WINDOWS (64-BIT ONLY)
 > 
 > AND PLEASE DO NOT USE THIS YET BECAUSE THE ENGINE ISN'T FINISHED YET WAIT UNTIL THE ENGINE'S RELEASE
 
 > [!CAUTION]
 > THE FOLLOWING INSTRUCTIONS IS SOMEWHAT OUTDATED (STILL) IT WILL BE UPDATED AGAIN LATER
 
 If you want to compile the game, follow these steps:
 1. [Install Haxe 4.3.7](https://haxe.org/download/version/4.3.7/)
 2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe (It is recommended to skip this step for now)
 
 Now open cmd and type the following commands:
 ```bash
 haxelib install lime 8.1.2
 haxelib install openfl 9.5.0
 haxelib install flixel 5.3.1
 haxelib install flixel-addons 3.0.2
 haxelib install flixel-ui 2.5.0
 haxelib install hscript 2.4.0
 haxelib install hxvlc 1.9.3
 haxelib run lime setup flixel
 haxelib run lime setup
 haxelib install hxdiscord_rpc 1.1.1
 ```
 After you have installed all the libraries go to the RobZEngine folder and open terminal and place:
 ```bash
 lime test windows
 ```
 or
 ```bash
 lime test windows -debug
 ```
 The lime test windows -debug is used to see the errors in the compilation.

 Is it normal to get warnings after compiling?

 Yes, if it is not red, then it is a warning not an error

### Logging
 Use `EngineCore.log()` instead of `trace` when debugging mods.
 Logs are automatically disabled in release builds.