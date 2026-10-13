#!/bin/bash

set -e

PROJECT_NAME="MageSkate"

echo "Creating Godot project structure: $PROJECT_NAME"

# Create project root
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Create directories
directories=(
    assets/characters/player
    assets/characters/enemies
    assets/characters/bosses
    assets/environments/elemental_tower
    assets/environments/wicked_forest
    assets/environments/lost_necropolis
    assets/spells
    assets/ui
    assets/audio/music
    assets/audio/sfx
    assets/fonts

    scenes/main
    scenes/menus
    scenes/player
    scenes/worlds/elemental_tower
    scenes/worlds/wicked_forest
    scenes/worlds/lost_necropolis
    scenes/spells
    scenes/enemies
    scenes/bosses
    scenes/ui

    scripts/core
    scripts/player
    scripts/movement
    scripts/perspective
    scripts/spells
    scripts/combat
    scripts/enemies
    scripts/bosses
    scripts/resources
    scripts/world
    scripts/ui

    resources/spells
    resources/enemies
    resources/levels

    shaders
    docs
)

for directory in "${directories[@]}"; do
    mkdir -p "$directory"
done

# Create empty files without overwriting existing files
create_files() {
    for file in "$@"; do
        if [[ ! -e "$file" ]]; then
            touch "$file"
        fi
    done
}

# Main project
create_files project.godot

# Main scenes
create_files \
    scenes/main/main.tscn \
    scenes/menus/title_screen.tscn \
    scenes/menus/settings_menu.tscn \
    scenes/menus/pause_menu.tscn \
    scenes/menus/credits.tscn

# Player scenes
create_files \
    scenes/player/player_2d.tscn \
    scenes/player/player_3d.tscn

# World scenes
for world in elemental_tower wicked_forest lost_necropolis; do
    create_files \
        "scenes/worlds/$world/level_1.tscn" \
        "scenes/worlds/$world/level_2.tscn" \
        "scenes/worlds/$world/boss_level.tscn"
done

# Spell scenes
create_files \
    scenes/spells/thunderbolt.tscn \
    scenes/spells/fireball.tscn \
    scenes/spells/time_stop.tscn \
    scenes/spells/raise_dead.tscn \
    scenes/spells/plant_growth.tscn \
    scenes/spells/ricochet_shot.tscn \
    scenes/spells/ice_spray.tscn

# Enemy scenes
create_files \
    scenes/enemies/wizard.tscn \
    scenes/enemies/witch.tscn \
    scenes/enemies/druid.tscn \
    scenes/enemies/familiar.tscn \
    scenes/enemies/homunculus.tscn

# Boss scenes
create_files \
    scenes/bosses/apprentice_mage.tscn \
    scenes/bosses/pyromancer.tscn \
    scenes/bosses/druid_boss.tscn \
    scenes/bosses/necromancer.tscn \
    scenes/bosses/arch_mage.tscn

# UI scenes
create_files \
    scenes/ui/hud.tscn \
    scenes/ui/mana_bar.tscn \
    scenes/ui/health_bar.tscn \
    scenes/ui/spell_selection.tscn

# Core scripts
create_files \
    scripts/core/game_manager.gd \
    scripts/core/level_manager.gd \
    scripts/core/save_manager.gd \
    scripts/core/scene_transition.gd

# Player scripts
create_files \
    scripts/player/player_controller_2d.gd \
    scripts/player/player_controller_3d.gd \
    scripts/player/player_stats.gd \
    scripts/player/player_health.gd \
    scripts/player/player_spell_manager.gd

# Movement scripts
create_files \
    scripts/movement/skate_movement.gd \
    scripts/movement/trick_system.gd \
    scripts/movement/movement_physics.gd

# Perspective scripts
create_files \
    scripts/perspective/perspective_manager.gd \
    scripts/perspective/perspective_shift.gd

# Spell scripts
create_files \
    scripts/spells/spell_base.gd \
    scripts/spells/spell_manager.gd \
    scripts/spells/thunderbolt.gd \
    scripts/spells/fireball.gd \
    scripts/spells/time_stop.gd \
    scripts/spells/raise_dead.gd \
    scripts/spells/plant_growth.gd \
    scripts/spells/ricochet_shot.gd \
    scripts/spells/ice_spray.gd

# Combat scripts
create_files \
    scripts/combat/health_component.gd \
    scripts/combat/damage_component.gd \
    scripts/combat/hitbox.gd

# Enemy scripts
create_files \
    scripts/enemies/enemy_base.gd \
    scripts/enemies/enemy_controller.gd \
    scripts/enemies/enemy_spawner.gd

# Boss scripts
create_files \
    scripts/bosses/boss_base.gd \
    scripts/bosses/boss_phase_manager.gd

# Resource scripts
create_files \
    scripts/resources/mana_manager.gd \
    scripts/resources/resource_regeneration.gd

# World scripts
create_files \
    scripts/world/level_exit.gd \
    scripts/world/checkpoint.gd \
    scripts/world/destructible_block.gd \
    scripts/world/puzzle_manager.gd \
    scripts/world/interactable.gd

# UI scripts
create_files \
    scripts/ui/title_screen.gd \
    scripts/ui/settings_menu.gd \
    scripts/ui/pause_menu.gd \
    scripts/ui/hud_controller.gd \
    scripts/ui/spell_selection.gd

# Spell resources
create_files \
    resources/spells/thunderbolt.tres \
    resources/spells/fireball.tres \
    resources/spells/time_stop.tres \
    resources/spells/raise_dead.tres \
    resources/spells/plant_growth.tres \
    resources/spells/ricochet_shot.tres \
    resources/spells/ice_spray.tres

# Shader files
create_files \
    shaders/fire.gdshader \
    shaders/ice.gdshader \
    shaders/perspective_effect.gdshader

# Documentation
create_files \
    docs/architecture.md \
    docs/coding_standards.md \
    docs/team_responsibilities.md

# Git configuration
if [[ ! -e .gitignore ]]; then
    cat > .gitignore <<'EOF'
# Godot generated files
.godot/

# Imported assets and exports
.import/
export.cfg
export_presets.cfg

# Editor and OS files
.DS_Store
Thumbs.db

# IDE settings
.vscode/
.idea/
EOF
fi

echo
echo "========================================"
echo " Mage Skate directory structure created!"
echo "========================================"
echo
echo "Project location: $(pwd)"
echo
echo "IMPORTANT:"
echo "- Script and scene files are empty placeholders."
echo "- Open the project through Godot to initialize it."
echo "- Create a Godot project configuration before running the game."
echo
echo "To inspect the structure, run:"
echo "  find . -maxdepth 4 -print | sort"
