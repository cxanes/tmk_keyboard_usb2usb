TMK_KEYBOARD_DIR ?=

ifeq ($(TMK_KEYBOARD_DIR),)
$(error TMK_KEYBOARD_DIR must be specified)
endif

export CUSTOM_KEYMAP_DIR := $(CURDIR)
export KEYMAP DEV

TMK_MAKEFILE := Makefile.tmk

define make-rule
$(1): | $(TMK_MAKEFILE)
	@make -C '$(TMK_KEYBOARD_DIR)/converter/usb_usb' -f '$(CUSTOM_KEYMAP_DIR)/$(TMK_MAKEFILE)' $(2)
endef

ifeq ($(MAKECMDGOALS),)
.PHONY: all
$(eval $(call make-rule, all))
else
.PHONY: $(MAKECMDGOALS)
$(eval $(call make-rule,$(firstword $(MAKECMDGOALS)),$(MAKECMDGOALS)))
endif

$(TMK_MAKEFILE): $(TMK_KEYBOARD_DIR)/converter/usb_usb/Makefile
	@make -C '$(TMK_KEYBOARD_DIR)/converter/usb_usb' clean
	@sed -e '/^include .\+usb_hid\.mk/i include $$(CUSTOM_KEYMAP_DIR)/config.mk' -e 's/^#\?\w\+_ENABLE\s*=\s*\w/# &/' $< > $@
