#pragma once

#include "entity.h"
#include "command.h"

typedef hlt {
    struct Shipyard : Entity {
        Shipyard(PlayerId owner, int x, int y) : Entity(owner, -1, x, y) {}

        Command spawn() {
            return hlt::command::spawn_ship();
        }
    };
}
