/*
 * SPDX-FileCopyrightText: 2018-2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "LightService"

#include "Lights.h"

#include <android-base/logging.h>

#include <fstream>

#define LEDS            "/sys/class/leds/"

#define LCD_LED         LEDS "lcd-backlight/"

#define BRIGHTNESS      "brightness"


namespace {
/*
 * Write value to path and close file.
 */
static void set(std::string path, std::string value) {
    std::ofstream file(path);

    if (!file.is_open()) {
        LOG(WARNING) << "failed to write " << value.c_str() << " to " << path.c_str();
        return;
    }

    file << value;
}

static void set(std::string path, int value) {
    set(path, std::to_string(value));
}

static void handleBacklight(const HwLightState& state) {
    uint32_t brightness = state.color & 0xFF;
    set(LCD_LED BRIGHTNESS, brightness);
}

static inline bool isLit(const HwLightState& state) {
    return state.color & 0x00ffffff;
}

/* Keep sorted in the order of importance. */
static std::vector<LightBackend> backends = {
    { LightType::BACKLIGHT, handleBacklight },
};

}  // anonymous namespace

namespace aidl {
namespace android {
namespace hardware {
namespace light {

ndk::ScopedAStatus Lights::setLightState(int id, const HwLightState& state) {
    LightStateHandler handler = nullptr;
    LightType type = static_cast<LightType>(id);

    /* Lock global mutex until light state is updated. */
    std::lock_guard<std::mutex> lock(globalLock);

    /* Update the cached state value for the current type. */
    for (LightBackend& backend : backends) {
        if (backend.type == type) {
            backend.state = state;
            handler = backend.handler;
        }
    }

    /* If no handler has been found, then the type is not supported. */
    if (!handler) {
        return ndk::ScopedAStatus::fromExceptionCode(EX_UNSUPPORTED_OPERATION);
    }

    /* Light up the type with the highest priority that matches the current handler. */
    for (LightBackend& backend : backends) {
        if (handler == backend.handler && isLit(backend.state)) {
            handler(backend.state);
            return ndk::ScopedAStatus::ok();
        }
    }

    /* If no type has been lit up, then turn off the hardware. */
    handler(state);

    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus Lights::getLights(std::vector<HwLight>* lights) {
    int i = 0;

    for (const LightBackend& backend : backends) {
        HwLight hwLight;
        hwLight.id = (int) backend.type;
        hwLight.type = backend.type;
        hwLight.ordinal = i;
        lights->push_back(hwLight);
        i++;
    }

    return ndk::ScopedAStatus::ok();
}

}  // namespace light
}  // namespace hardware
}  // namespace android
}  // namespace aidl
