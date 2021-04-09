#define NDEBUG
#if !defined(NDEBUG)
#define DEBUG
#endif

#include <LiquidCrystal_I2C.h>
#include <OneWire.h>
#include "pin.h"
#include "button.h"
#include "heatingelement.h"

#define ANALOG_INP_PIN A0

LiquidCrystal_I2C lcd(0x27, 16, 2);
OneWire temp_sensor(2);

uint32_t main_timer = 0, menu_timer = 0;
uint16_t analog_input = 0;
const uint8_t lower_switch_pin = 4, higher_switch_pin = 5;

Button btn_Up = {8, LOW}, btn_Down = {9, LOW};
Button btn_Cancel = {10, LOW};
HeatingElement heating_element = {7, lower_switch_pin, false};

uint8_t degree[8] = {
    0b00110,
    0b01001,
    0b01001,
    0b00110,
    0b00000,
    0b00000,
    0b00000,
    0b00000
};

/*
 *  0 - show system status; user did not pressed btn_Up for that yet
 *      or rejected last confirmation request
 *  1 - show confirmation menu for changing heating element state
 *      or parameters (after confirm heater is on, set default
 *      heating_element.m_required_temp=40, m_timer=0 (does not set)
 *  2 - show confirmation menu for setting requered temp(one click)
 *      or timer(double click) on the btn_Up
 *  3 - show temp  setting menu  (changing value by potentiometer)
 *  4 - show timer setting menu  (changing value by potentiometer)
 *  5 - force abort the heating, flush parameters
 *  6 - show warning: probably heating is not working - after 1 hour
 *      curr_temp is not changed positively (does not emplemented yet)
 */
enum menuStage {
    main_screen,
    confirm_heating_params_change,
    heating_turn_on_and_setup,
    temp_change,
    timer_change,
    heating_turn_off,
    warning,
};
menuStage curr_menu = main_screen;


void setup(void) {
    Serial.begin(9600);
    lcd.init ();
    lcd.backlight();
    lcd.createChar(0, degree);
    pinMode(lower_switch_pin, INPUT);
    pinMode(higher_switch_pin, INPUT);
    pinMode(btn_Up.pin_num(), INPUT);
    pinMode(btn_Down.pin_num(), INPUT);
    pinMode(btn_Cancel.pin_num(), INPUT);
    pinMode(heating_element.pin_num(), OUTPUT);
    lcd.print("starting...");
    delay(200);
}

void loop(void) {
    uint8_t data[12];
    uint8_t addr[8];
    float curr_temp;
    
    if (millis() - main_timer >= 7)  {
        if (!temp_sensor.search(addr)) {
            //Serial.print("No more addresses.\n");
            temp_sensor.reset_search();
            return;
        }
        temp_sensor.reset();
        temp_sensor.select(addr);
        temp_sensor.write(0x44, 1);
        // we might do a temp_sensor.depower() here, but the reset will take care of it.
        temp_sensor.reset();
        temp_sensor.select(addr);
        temp_sensor.write(0xBE);         // Read Scratchpad

        for (uint8_t i = 0; i < 9; i++) {       // we need 9 bytes
            data[i] = temp_sensor.read();
        }
        // Convert the data to actual temperature, result is a 16bit signed int
        int16_t raw = (data[1] << 8) | data[0];
        byte cfg = (data[4] & 0x60);
        if (cfg == 0x00) raw = raw & ~7;
        else if (cfg == 0x20) raw = raw & ~3;
        else if (cfg == 0x40) raw = raw & ~1;

        curr_temp = (float)raw / 16.0;

        if (heating_element.checkCurrentState(curr_temp, main_timer)) {
            digitalWrite(heating_element.pin_num(), HIGH);
        } else {
            digitalWrite(heating_element.pin_num(), LOW);
        }

        btn_Up.checkState();
        btn_Down.checkState();
        btn_Cancel.checkState();

        do {
            main_timer += 3;
            if (main_timer < 3)
                break;  // uint32_t overflow
        } while (main_timer < (millis() - 3));
    }

    if (millis() - menu_timer >= 5) {
        lcd.clear();

        if (btn_Cancel.state()) {
            if (btn_Cancel.is_long_press()) {
                curr_menu = heating_turn_off;
                heating_element.turn_off();
            }
            else
                curr_menu = main_screen;
        }

        switch (curr_menu) {
            case (main_screen):
                lcd.setCursor(0, 0);
                lcd.print(curr_temp);
                lcd.setCursor(4, 0);
                lcd.write(0);
                lcd.setCursor(5, 0);
                lcd.print("C");

                lcd.setCursor(0, 1);
                lcd.print("Heater:");
                lcd.setCursor(7, 1);
                if (heating_element.state())
                    lcd.print("on");
                else
                    lcd.print("off");

                // float switches are connected through pull-down resistor (R=10kOhm)
                lcd.setCursor(12, 0);
                if (digitalRead(lower_switch_pin) == HIGH)   // closed
                    lcd.print(">");
                else                                         // open
                    lcd.print("<");
                lcd.setCursor(13, 0);
                lcd.print("min");

                lcd.setCursor(12, 1);
                if (digitalRead(higher_switch_pin) == HIGH)  // closed
                    lcd.print(" ");
                else                                         // open
                    lcd.print("<");

                if (btn_Up.state() || btn_Down.state()) {
                    curr_menu = confirm_heating_params_change;
                }
                lcd.setCursor(13, 1);
                lcd.print("max");
                break;

            case (confirm_heating_params_change):
                lcd.setCursor(0,0);
                lcd.print("Proceed?");
                lcd.setCursor(0, 1);
                lcd.print("Up/Down-Yes|Cancel-No");
                if (btn_Up.state() || btn_Down.state()) {
                    curr_menu = heating_turn_on_and_setup;
                }
                break;

            case (heating_turn_on_and_setup):
                heating_element.turn_on();
                lcd.setCursor(0,0);
                lcd.print("press up/down for");
                lcd.setCursor(0,1);
                lcd.print("temp/timer change");
                if (btn_Up.state())
                    curr_menu = temp_change;
                else if (btn_Down.state())
                    curr_menu = timer_change;
                else if (btn_Cancel.state())
                    curr_menu = main_screen;
                break;

            case (temp_change):
                analog_input = analogRead(ANALOG_INP_PIN);
                analog_input = map(analog_input, 0, 1023, 15, 55);
                analog_input = constrain(analog_input, curr_temp, 55);
                lcd.setCursor(0, 0);
                lcd.print("Set the temp");
                lcd.setCursor(0, 1);
                lcd.print(analog_input);
                lcd.setCursor(3, 1);
                lcd.write(0);
                lcd.setCursor(4, 1);
                lcd.print("C");
                if (btn_Up.state() || btn_Down.state()) {
                    heating_element.setRequired_temp(analog_input);
                    curr_menu = main_screen;
                }
                break;

            case (timer_change):
                analog_input = analogRead(ANALOG_INP_PIN);
                analog_input = map(analog_input, 0, 1023, 0, 270);
                analog_input = constrain(analog_input, 0, 270);
                uint8_t mins, hours;
                hours = (analog_input > 60) ? hours = analog_input / 60 : 0;
                mins = analog_input - hours * 60;
                lcd.setCursor(0, 0);
                lcd.print("Set the timer");
                lcd.setCursor(0, 1);
                lcd.print(hours);
                lcd.setCursor(2, 1);
                lcd.print("hours");
                lcd.setCursor(8, 1);
                lcd.print(mins);
                lcd.print("min");
                if (btn_Up.state() || btn_Down.state()) {
                    heating_element.setTimer(analog_input);
                    curr_menu = main_screen;
                }
                break;

            default:
                curr_menu = main_screen;
                break;
        }
        menu_timer = millis();
    }
}
