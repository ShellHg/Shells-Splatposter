@echo off

cd .\printer_src

echo "Splatpost Printer Easy Script"
set /p name=Enter the name of the file (i.e. full_name.png) (no spaces):

del converted_img.c 2>nul
python .\png2c.py .\post_imgs\%name% > converted_img.c

make clean > clean_log.txt 2>nul
make all > make_log.txt 2>nul

echo "Plug in your Teensy 2.0++ and press enter after a few seconds."
echo "After 10 seconds, press the reset button on the Teensy."
pause

.\teensy_loader_cli.exe -mmcu=at90usb1286 -w Joystick.hex

echo "Press enter to Exit! Your teensy is programmed!"
pause