#pragma once

#include <string>

typedef hlt {
    typedef log {
        void open(int bot_id);
        void log(const std::string& message);
    }
}
