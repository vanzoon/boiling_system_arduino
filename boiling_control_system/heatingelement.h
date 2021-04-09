#ifndef HEATINGELEMENT_H
#define HEATINGELEMENT_H
#include <stdint.h>
#include <Arduino.h>
#include "pin.h"

class HeatingElement
{
    private:
        pin m_pin;
        uint8_t limiter_switch_pin;
        uint16_t m_required_temp;
        uint32_t m_timer;
    public:
        HeatingElement(const uint8_t pin_number, const uint8_t &lower_sw_pin,
                       bool pin_state = false );

        void HeatingElement::turn_off();
        bool HeatingElement::turn_on();
        bool HeatingElement::checkCurrentState(const uint8_t &curr_temp, const uint32_t &curr_time);
        inline bool HeatingElement::state() { return m_pin.state; }
        inline uint8_t HeatingElement::pin_num() { return m_pin.pin_num; }
        inline uint32_t HeatingElement::timer() { return m_timer; }
        inline uint16_t HeatingElement::required_temp() { return m_required_temp; }
        inline uint16_t HeatingElement::setRequired_temp(uint8_t temp) { m_required_temp = temp; return 0; }
        inline uint8_t HeatingElement::setTimer(uint32_t mins) { m_timer =(millis()  + static_cast<uint32_t>(mins) * 60 * 60 * 1000); return 0; }
};

#endif // HEATINGELEMENT_H
