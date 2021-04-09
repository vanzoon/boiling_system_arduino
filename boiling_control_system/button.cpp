#include "button.h"

Button::Button(const uint8_t pin_number, bool pin_state = false):
    m_pin{pin_number, pin_state},
    m_timer{0},
    m_long_press{0}
{

};

void Button::checkState() {
    if (digitalRead(m_pin.pin_num) == HIGH) {
        if (m_pin.state == LOW) {
            m_pin.state = HIGH;
            m_timer = millis();
#ifdef DEBUG
            Serial.print("Clicked- Btn:");
            Serial.println(m_pin.pin_num);
#endif
        }
        if ((millis() - m_timer > LONG_PRESS_TIME) && !(m_long_press)) {
            m_long_press = true;
#ifdef DEBUG
            Serial.print("Long press- Btn:");
            Serial.println(m_pin.pin_num);
#endif
        }
    } else {
        if (m_pin.state == HIGH) {
            m_pin.state = LOW;
            m_long_press = false;
#ifdef DEBUG
            Serial.print("Released- Btn:");
            Serial.println(m_pin.pin_num);
#endif
        }
    }
}
