#ifndef BUTTON_H
#define BUTTON_H

#include <stdint.h>
#include <Arduino.h>
#include "pin.h"
#define LONG_PRESS_TIME 800

class Button {
    private:
        pin m_pin;
        uint32_t m_timer;
        uint8_t m_long_press;
    public:
        Button(const uint8_t pin_number, bool pin_state = false);

        void checkState();
        inline uint8_t pin_num() { return m_pin.pin_num; }
        inline uint8_t state() { return m_pin.state; }
        inline uint8_t is_long_press() { return m_long_press; }
};
#endif // BUTTON_H
