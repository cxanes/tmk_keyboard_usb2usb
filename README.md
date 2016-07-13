# tmk_keyboard_usb2usb
My own configuration (cxanes) for TMK keyboard firmware (USB to USB keyboard protocol converter)

* Main repo: <http://github.com/tmk/tmk_keyboard>
* Toolchain: <http://avr-eclipse.sourceforge.net/wiki/index.php/The_AVR_GCC_Toolchain>

Hardware requirement:

 * Arduino Leonardo
 * USB Host Shield 2.0

Build:

    $ git clone https://github.com/tmk/tmk_keyboard.git
    Modifiy Makefile.sample: set TMK_KEYBOARD_DIR to the path of tmk_keyboard
    $ make -f Makefile.sample

Program:

    $ sudo make -f Makefile.sample program
