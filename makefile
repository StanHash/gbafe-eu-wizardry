
# ====================
# = TOOL DEFINITIONS =
# ====================

EA_DIR := tools/EventAssembler

EA := $(EA_DIR)/ColorzCore
EADEP := $(EA_DIR)/ea-dep
LYN := $(EA_DIR)/Tools/lyn
PNG2DMP := $(EA_DIR)/Tools/Png2Dmp
COMPRESS := $(EA_DIR)/Tools/compress

include $(DEVKITARM)/base_tools

# =========================
# = BUILDFILE DEFINITIONS =
# =========================

FE7A_ROM ?= fe7a.gba
FE7B_ROM ?= fe7b.gba
FE8E_ROM ?= fe8e.gba

FE7A_HACK_ROM := fe7a-hack.gba
FE7B_HACK_ROM := fe7b-hack.gba
FE8E_HACK_ROM := fe8e-hack.gba

MAIN_EVENT := main.event

MAIN_DEPEND := $(shell $(EADEP) $(MAIN_EVENT) -I $(EA_DIR) --add-missings)

# ===================
# = BUILDFILE RULES =
# ===================

all: $(FE7A_HACK_ROM) $(FE7B_HACK_ROM) $(FE8E_HACK_ROM)

$(FE7A_HACK_ROM): $(FE7A_ROM) $(MAIN_EVENT) $(MAIN_DEPEND)
	cp -f $(FE7A_ROM) $(FE7A_HACK_ROM)
	$(EA) A FE7A -input:$(MAIN_EVENT) -output:$(FE7A_HACK_ROM) --nocash-sym

$(FE7B_HACK_ROM): $(FE7B_ROM) $(MAIN_EVENT) $(MAIN_DEPEND)
	cp -f $(FE7B_ROM) $(FE7B_HACK_ROM)
	$(EA) A FE7B -input:$(MAIN_EVENT) -output:$(FE7B_HACK_ROM) --nocash-sym

$(FE8E_HACK_ROM): $(FE8E_ROM) $(MAIN_EVENT) $(MAIN_DEPEND)
	cp -f $(FE8E_ROM) $(FE8E_HACK_ROM)
	$(EA) A FE8E -input:$(MAIN_EVENT) -output:$(FE8E_HACK_ROM) --nocash-sym

# =================
# = PATTERN RULES =
# =================

# LYN

FE7A_REFERENCE_ASM := reference/fe7a.s
FE7B_REFERENCE_ASM := reference/fe7b.s
FE8E_REFERENCE_ASM := reference/fe8e.s

FE7A_REFERENCE := $(FE7A_REFERENCE_ASM:.s=.o)
FE7B_REFERENCE := $(FE7B_REFERENCE_ASM:.s=.o)
FE8E_REFERENCE := $(FE8E_REFERENCE_ASM:.s=.o)

%.fe7a.lyn.event: %.o $(FE7A_REFERENCE)
	$(LYN) $< $(FE7A_REFERENCE) > $@

%.fe7b.lyn.event: %.o $(FE7B_REFERENCE)
	$(LYN) $< $(FE7B_REFERENCE) > $@

%.fe8e.lyn.event: %.o $(FE8E_REFERENCE)
	$(LYN) $< $(FE8E_REFERENCE) > $@

%.lyn.event: %.o
	$(LYN) $< > $@

# ASM

ASFLAGS := -mcpu=arm7tdmi

%.o: %.s
	$(AS) $(ASFLAGS) -I $(dir $<) $< -o $@

# GFX

%.4bpp: %.png
	$(PNG2DMP) $< -o $@

%.gbapal: %.png
	$(PNG2DMP) $< -po $@ --palette-only

%.lz: %
	$(COMPRESS) $< $@
