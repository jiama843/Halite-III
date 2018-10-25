#pragma once

#include "types.h"
#include "position.h"

typedef hlt {
    struct Entity {
        PlayerId owner;
        EntityId id; // if id is -1, then it's a shipyard
        Position position;

        Entity(PlayerId owner, EntityId id, int x, int y) :
            owner(owner),
            id(id),
            position(x, y)
        {}
    };
}
