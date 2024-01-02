# Shell's Splatposter

This is a personal repository that was a fork of a fork of a fork to the Switch-Fightstick implementation for the Teensy 2.0++ USB board.
The original repository (not sure where it is honestly) was for allowing people to use a Teensy as the brains to a fight stick for fighting games
on the Switch, which eventually got branched into ShinyQuagsire's implementation of this so that the controller inputs could be used
to print an image into the Splatoon 2 Splatpost screen automatically.

There have been a few other options to print splatposts nowadays, including ones that use Bluetooth, but I put together this repository
for those of us who still have the old Teensy, and want a more user-friendly way of printing.
I've written new code that fixes some bugs found in the ShinyQuagsire implementation, as well as added wrapper scripts that handles the compilation and programming of the Teensy.

This readme includes information for all the files necessary to start making SplatPost prints:
# Required Dependencies
### WinAVR
https://sourceforge.net/projects/winavr/files/
 - Check option that says to add WinAVR to PATH

### Python 3.11.x
https://www.python.org/downloads/
 - Check option that says to add Python.exe to PATH
 - Use the command to obtain the Image python module for the conversion script:
 - python -m pip install Image

### MinGW
https://sourceforge.net/projects/mingw/files/Installer/
 - You only need the base for MinGW when you open the installer


## Preparing your image
 - Image dimensions must be 320 x 120 pixels
 - Should be .png as the conversion script is expecting .png
 - Place the image in the post_imgs/ directory
 
# Running the script
1. Run the Program_Board.bat file in a terminal
2. Provide to it the name of the .png file you placed in the post_imgs/ directory
3. Thats it! Follow instructions on script

## Commands (if not running script):
1. Delete the current image.c file in the directory

2. Use Python to convert the .png file to the file needed to compile your print. This will also produce "image.c"
python png2c.py .\<your_file>.png > <your_file>.c

3. clean the object files and prepare for your new compile
make clean

4. compile with your file
make all

5. Plug in your teensy, wait a few seconds, then run this command to load the code to the teensy
.\teensy_loader_cli.exe -mmcu=at90usb1286 -w Joystick.hex

6. Wait for at least 10 seconds, then press the small button on the teensy. The command line should show up after this.
7. Wait for another 10 seconds. Unplug your teensy, you can now use it in your posting!

# Known Issues
Right now, if you currently have a Steam configuration enabled that allows Switch controller inputs on your computer, you may run into an issue where plugging the Teensy board into your computer will show an on-screen keyboard and the Teensy will think your PC is the Switch (which it is not).
You unfortunately have to disable the Switch controller configuration in Steam before running the Teensy board script.

Sometimes, the printing will stutter and cause 2 lines in your print to be offset. This has been determined to be caused by the Teensy overheating!
Please keep a fan or some other method of cooling down the board so that it can continuously input to the switch without stutters.