#include "heatingelement.h"

HeatingElement::HeatingElement(const uint8_t pin_number,
                               const uint8_t &lower_sw_pin,
                               bool pin_state = false):
            m_pin{pin_number, pin_state},
            limiter_switch_pin{lower_sw_pin},
            m_required_temp{0},
            m_timer{0}
{

}

bool HeatingElement::turn_on() {
    if (digitalRead(limiter_switch_pin) == HIGH) {
        m_pin.state = true;
        m_required_temp = 40;
        return 1;
    }
    return 0;
}

void HeatingElement::turn_off() {
    m_pin.state = false;
    m_required_temp = 0;
    m_timer = 0;
}

bool HeatingElement::checkCurrentState(const uint8_t &curr_temp,
                                      const uint32_t &curr_time) {
    if (m_pin.state) {
        if ((m_timer && (m_timer < curr_time)) ||
            (m_required_temp <= curr_temp)) {
            turn_off();
#ifdef DEBUG
            Serial.println("heating element turned off");
#endif
            return 0;
        }
        return 1;
    }
    return 0;
}
