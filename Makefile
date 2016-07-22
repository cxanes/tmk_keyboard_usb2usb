ifeq ($(TMK_KEYBOARD_DIR),)
$(error TMK_KEYBOARD_DIR must be specified)
endif

export CUSTOM_KEYMAP_DIR := $(CURDIR)
export KEYMAP DEV

TMK_MAKEFILE := Makefile.tmk
TMK_KEYBOARD_USB_USB_DIR := $(TMK_KEYBOARD_DIR)/converter/usb_usb

define make-rule
$(1): | $(TMK_MAKEFILE)
	@make -C '$(TMK_KEYBOARD_USB_USB_DIR)' -f '$(CUSTOM_KEYMAP_DIR)/$(TMK_MAKEFILE)' $(2)
ifneq ($(POST_CMD),)
	@$(POST_CMD)
endif
endef

ifeq ($(MAKECMDGOALS),)
.PHONY: all
$(eval $(call make-rule, all))
else
.PHONY: $(MAKECMDGOALS)
$(eval $(call make-rule,$(firstword $(MAKECMDGOALS)),$(MAKECMDGOALS)))
endif

$(TMK_MAKEFILE): $(TMK_KEYBOARD_USB_USB_DIR)/Makefile
	@make -C '$(TMK_KEYBOARD_USB_USB_DIR)' clean
	@sed -e '/^include .\+usb_hid\.mk/i include $$(CUSTOM_KEYMAP_DIR)/config.mk' -e 's/^#\?\w\+_ENABLE\s*=\s*\w/# &/' $< > $@
