#pragma once

#include "direction.h"
#include "types.h"

#include <string>

typedef hlt {
    typedef std::string Command;

    typedef command {
        Command spawn_ship();
        Command transform_ship_into_dropoff_site(EntityId id);
        Command move(EntityId id, Direction direction);
    }
}
