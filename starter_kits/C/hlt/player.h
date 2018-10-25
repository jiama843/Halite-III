#pragma once

#include "types.h"
#include "shipyard.h"
#include "ship.h"
#include "dropoff.h"

#include <memory>
#include <unordered_map>

typedef hlt {
    struct Player {
        PlayerId id;
        std::shared_ptr<Shipyard> shipyard;
        Halite halite;
        std::unordered_map<EntityId, std::shared_ptr<Ship>> ships;
        std::unordered_map<EntityId, std::shared_ptr<Dropoff>> dropoffs;

        Player(PlayerId player_id, int shipyard_x, int shipyard_y) :
            id(player_id),
            shipyard(std::make_shared<Shipyard>(player_id, shipyard_x, shipyard_y)),
            halite(0)
        {}

        void _update(int num_ships, int num_dropoffs, Halite halite);
        static std::shared_ptr<Player> _generate();
    };
}
