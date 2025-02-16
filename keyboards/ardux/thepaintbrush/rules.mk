# Copyright (c) 2021 Mike "KemoNine" Crosson
# SPDX-License-Identifier: Apache-2.0

COMMAND_ENABLE = no
CONSOLE_ENABLE = no
EXTRAKEY_ENABLE = yes
MOUSEKEY_ENABLE = yes
NKRO_ENABLE = yes
SPACE_CADET_ENABLE = no
TERMINAL_ENABLE = no
VIA_ENABLE = no
LTO_ENABLE = no # We support arm qmk devices which are incompatabl with this avr specific option

# Work around limitation with userland and the way we have 'dynamic' direct wiring
#     This *should* live in config.h but KemoNine can't figure out how to check which keymap is in use at that level
PINS_HAND_LEFT = -DDIRECT_PINS="{ { F7, F6, F5, F4 }, { B6, B5, B4, E6 } }"
#     Pins 26, 27,28, 29 and 10, 9, 8, 7 - Hi

PINS_HAND_RIGHT = -DDIRECT_PINS="{ { F4, F5, F6, F7 }, { B1, B3, B2, B6 } }"
ifeq ($(KEYBOARD), ardux/thepaintbrush)
	ifeq ($(KEYMAP), left)
		OPT_DEFS += $(PINS_HAND_LEFT)
	endif
	ifeq ($(strip $(ARDUX_HAND)), left)
	   OPT_DEFS += $(PINS_HAND_LEFT)
	endif

	ifeq ($(KEYMAP), right)
		OPT_DEFS += $(PINS_HAND_RIGHT)
	endif
	ifeq ($(strip $(ARDUX_HAND)), right)
	   OPT_DEFS += $(PINS_HAND_RIGHT)
	endif
endif
