#ifndef CONFIG_CUSTOM_H
#define CONFIG_CUSTOM_H

#include <config.h>

/* key combination for command */
#ifdef IS_COMMAND
#undef IS_COMMAND
#define IS_COMMAND() ( \
    keyboard_report->mods == (MOD_BIT(KC_LCTRL) | MOD_BIT(KC_RCTRL)) || \
    keyboard_report->mods == (MOD_BIT(KC_LGUI) | MOD_BIT(KC_RGUI)) || \
    keyboard_report->mods == (MOD_BIT(KC_LSHIFT) | MOD_BIT(KC_RSHIFT)) \
)
#endif

#endif
