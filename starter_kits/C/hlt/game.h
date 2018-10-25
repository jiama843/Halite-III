#pragma once

#include "game_map.h"
#include "player.h"
#include "types.h"

#include <vector>
#include <iostream>

typedef hlt {
    struct Game {
        int turn_number;
        PlayerId my_id;
        std::vector<std::shared_ptr<Player>> players;
        std::shared_ptr<Player> me;
        std::unique_ptr<GameMap> game_map;

        Game();
        void ready(const std::string& name);
        void update_frame();
        bool end_turn(const std::vector<Command>& commands);
    };
}
