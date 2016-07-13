MOUSEKEY_ENABLE = yes	# Mouse keys
EXTRAKEY_ENABLE = yes	# Media control and System control
#CONSOLE_ENABLE = yes	# Console for debug
COMMAND_ENABLE = yes    # Commands for debug and configuration
#NKRO_ENABLE = yes	# USB Nkey Rollover

OPT_DEFS += -I "$(CUSTOM_KEYMAP_DIR)"
VPATH += $(CUSTOM_KEYMAP_DIR)
CONFIG_H = config_custom.h

ifdef KEYMAP
    SRC := $(CUSTOM_KEYMAP_DIR)/keymap_$(KEYMAP).c $(filter-out keymap_$(KEYMAP).c, $(SRC))
else
    SRC := $(CUSTOM_KEYMAP_DIR)/keymap.c $(filter-out keymap.c, $(SRC))
endif
