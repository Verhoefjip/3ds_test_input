
TARGET := hello_3ds
BUILD := build
SOURCE := .
INCLUDE := .
LIBS := -lctru -lm
CFLAGS := -g -Wall -O2 -mfloat-abi=hard -march=armv6k -mtune=mpcore -fomit-frame-pointer
CFLAGS += $(INCLUDE:%=-I%)
LDFLAGS := $(LIBS)

CC := $(DEVKITARM)/bin/arm-none-eabi-g++
AR := $(DEVKITARM)/bin/arm-none-eabi-ar

OUTPUT := $(TARGET)

SOURCES := $(wildcard $(SOURCE)/*.cpp)
OBJECTS := $(patsubst $(SOURCE)/%.cpp,$(BUILD)/%.o,$(SOURCES))

.PHONY: all clean

all: $(OUTPUT).3dsx

$(OUTPUT).3dsx: $(OUTPUT).elf
	3dsxtool $< $@

$(OUTPUT).elf: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(BUILD)/%.o: $(SOURCE)/%.cpp
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf $(BUILD) $(TARGET).elf $(TARGET).3dsx
