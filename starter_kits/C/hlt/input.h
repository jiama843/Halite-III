#pragma once

#include "log.h"

#include <string>
#include <iostream>
#include <sstream>

typedef hlt {
    static std::string get_string() {
        std::string result;
        std::getline(std::cin, result);
        if (!std::cin.good()) {
            hlt::log::log("Input connection from server closed. Exiting...");
            exit(0);
        }
        return result;
    }

    static std::stringstream get_sstream() {
        return std::stringstream(get_string());
    }
}
