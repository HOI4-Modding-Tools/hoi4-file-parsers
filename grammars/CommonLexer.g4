/*
Defines standard tokens common to a variety of contexts.
*/

lexer grammar CommonLexer;

COMMENT: '#' .*? ENDLINE -> skip;
WS: [ \t] -> skip;
ENDLINE: '\r'?'\n';

//Key Words
START_RESOURCES_BLOCK: 'resource s' WS* EQ WS* OPEN_BRACE -> pushMode(RequirementBlock);
START_NEEDED_EQUIPMENT_BLOCK: 'need' WS* EQ WS* OPEN_BRACE -> pushMode(RequirementBlock);
// Boolean properties
IS_ARCHETYPE_PROPERTY: 'is_archetype' ;
IS_BUILDABLE_PROPERTY: 'is_buildable';
IS_CONVERTABLE_PROPERTY: 'is_convertable';
ACTIVE_PROPERTY: 'active';
CARRIER_CAPABLE_PROPERTY: 'carrier_capable';
REQUIRED_PROPERTY: 'required';
IS_SPECIAL_FORCES_PROPERTY: 'special_forces';
IS_DEFAULT_PROPERTY: 'default';
SHARED_FOCUS_TREE_UNLOCKED: 'shared_focus_tree_unlocked';
// Int properties
YEAR_PROPERTY: 'year' ;
MAX_ORGANIZATION_PROPERTY: 'max_organization';
MAX_ORGANISATION_PROPERTY: 'max_organisation';
AIR_MAP_ICON_FRAME_PROPERTY: 'air_map_icon_frame';
INTERFACE_OVERVIEW_CATEGORY_INDEX_PROPERTY: 'interface_overview_category_index' ;
AIR_RANGE_PROPERTY: 'air_range';
MAXIMUM_SPEED_PROPERTY: 'maximum_speed';
AIR_AGILITY_PROPERTY: 'air_agility';
AIR_ATTACK_PROPERTY: 'air_attack';
AIR_DEFENCE_PROPERTY: 'air_defence';
AIR_GROUND_ATTACK_PROPERTY: 'air_ground_attack';
AIR_BOMBING_PROPERTY: 'air_bombing';
NAVAL_STRIKE_ATTACK_PROPERTY: 'naval_strike_attack';
NAVAL_STRIKE_TARGETING_PROPERTY: 'naval_strike_targetting';
MANPOWER_COST_PROPERTY: 'manpower';
PRIORITY_PROPERTY: 'priority';
AI_PRIORITY_PROPERTY: 'ai_priority';
VISUAL_LEVEL_PROPERTY: 'visual_level';
DEFAULT_CARRIER_COMPOSITION_PROPERTY: 'default_carrier_composition_weight';
TRAINING_TIME_PROPERTY: 'training_time';
COMBAT_WIDTH_PROPERTY: 'combat_width';
WEIGHT_PROPERTY: 'weight';
FACTOR: 'factor';
X_PROPERTY: 'x';
Y_PROPERTY: 'y';
DAYS: 'days';
AMOUNT: 'amount';
// Float properties
BONUS: 'bonus';
FUEL_CONSUMPTION_PROPERTY: 'fuel_consumption';
LEND_LEASE_COST_PROPERTY: 'lend_lease_cost';
BUILD_COST_IC_PROPERTY: 'build_cost_ic';
RELIABILITY_PROPERTY: 'reliability';
AIR_SUPERIORITY_PROPERTY: 'air_superiority';
DEFENSE_PROPERTY: 'defense';
BREAKTHROUGH_PROPERTY: 'breakthrough';
ARMOR_PROPERTY: 'armor_value';
HARDNESS_PROPERTY: 'hardness';
SOFT_ATTACK_PROPERTY: 'soft_attack';
HARD_ATTACK_PROPERTY: 'hard_attack';
ARMOR_PENETRATION_PROPERTY: 'ap_attack';
SUPPRESSION_PROPERTY: 'suppression';
NAVAL_LIGHT_GUN_ARMOR_PIERCING_PROPERTY: 'lg_armor_piercing';
NAVAL_LIGHT_GUN_ATTACK_PROPERTY: 'lg_attack';
NAVAL_HEAVY_GUN_ARMOR_PIERCING_PROPERTY: 'hg_armor_piercing';
NAVAL_HEAVY_GUN_ATTACK_PROPERTY: 'hg_attack';
TORPEDO_ATTACK_PROPERTY: 'torpedo_attack';
SUB_ATTACK_PROPERTY: 'sub_attack';
NAVAL_ANTI_AIR_ATTACK_PROPERTY: 'anti_air_attack';
NAVAL_SURFACE_DETECTION_PROPERTY: 'surface_detection';
NAVAL_SURFACE_VISIBILITY_PROPERTY: 'surface_visibility';
NAVAL_SPEED_PROPERTY: 'naval_speed';
NAVAL_RANGE_PROPERTY: 'naval_range';
MAX_STRENGTH_PROPERTY: 'max_strength';
DEFAULT_MORALE_PROPERTY: 'default_morale';
SUPPLY_CONSUMPTION_PROPERTY: 'supply_consumption';
COST_PROPERTY: 'cost';
USES: 'uses';
OWNS_STATE: 'owns_state';
ADD_MANPOWER: 'add_manpower';
ADD_EXTRA_STATE_SHARED_BUILDING_SLOTS: 'add_extra_state_shared_building_slots';
//String properties
//Identifier properties
PICTURE_PROPERTY: 'picture';
CATEGORY_PROPERTY: 'category';
TYPE_PROPERTY: 'type';
GROUP_BY_PROPERTY: 'group_by' -> pushMode(GroupByDeclaration);
INTERFACE_CATEGORY: 'interface_category';
SPRITE_PROPERTY: 'sprite';
ARCHETYPE_PROPERTY: 'archetype';
PARENT_PROPERTY: 'parent';
MAP_ICON_CATEGORY_PROPERTY: 'map_icon_category';
GROUP_PROPERTY: 'group';
TRANSPORT_PROPERTY: 'transport';
ID_PROPERTY: 'id';
SHARED_FOCUS_PROPERTY: 'shared_focus';
ICON_PROPERTY: 'icon';
RELATIVE_POSITION_ID: 'relative_position_id';
HIDDEN_EFFECT_PROPERTY: 'hidden_effect';
SET_COUNTRY_FLAG_PROPERTY: 'set_country_flag';
IDEA: 'idea';
// List properties
UPGRADES_PROPERTY: 'upgrades';
ALLOWED_MODULE_CATEGORIES_PROPERTY: 'allowed_module_categories';
CATEGORIES_PROPERTY: 'categories';
REMOVE_IDEAS: 'remove_ideas';
// map property
ADD_TECH_BONUS: 'add_tech_bonus';
MODULE_SLOTS_PROPERTY: 'module_slots';
FIXED_SHIP_COMMAND_SLOT_PROPERTY: 'fixed_ship_command_slot';
FIXED_SHIP_ENGINE_SLOT_PROPERTY: 'fixed_ship_engine_slot';
FIXED_SHIP_ENGINE_1_SLOT_PROPERTY: 'fixed_ship_engine_slot_1';
FIXED_SHIP_BATTERY_SLOT_PROPERTY: 'fixed_ship_battery_slot';
FIXED_SHIP_BATTERY_1_SLOT_PROPERTY: 'fixed_ship_battery_slot_1';
FIXED_SHIP_DETECTION_SLOT_PROPERTY: 'fixed_ship_detection_slot';
FIXED_SHIP_DETECTION_1_SLOT_PROPERTY: 'fixed_ship_detection_slot_1';
FIXED_SHIP_ARMOR_SLOT_PROPERTY: 'fixed_ship_armour_slot';
FIXED_SHIP_POINT_DEFENCE_SLOT_PROPERTY: 'fixed_ship_point_defense_slot';
FIXED_SHIP_POINT_DEFENCE_1_SLOT_PROPERTY: 'fixed_ship_point_defense_slot_1';
FIXED_SHIP_SUBSURFACE_SLOT_PROPERTY: 'fixed_ship_subsurface_slot';
FIXED_SHIP_COMMUNICATION_SLOT_PROPERTY: 'fixed_ship_communication_slot';
FIXED_SHIP_STORAGE_SLOT_PROPERTY: 'fixed_ship_storage_slot';
FIXED_SHIP_SPECIAL_SLOT_PROPERTY: 'fixed_ship_special_slot';
DEFAULT_MODULES_PROPERTY: 'default_modules';
FOCUS_PROPERTY: 'focus';
MODIFIER: 'modifier';
COMPLETION_REWARD_PROPERTY: 'completion_reward';
COUNTRY_EVENT: 'country_event';
PREREQUISITE_PROPERTY: 'prerequisite';
IS_AVAILABLE_PROPERTY: 'available';
ADD_TIMED_IDEA: 'add_timed_idea';
ADD_EQUIPMENT_TO_STOCKPILE: 'add_equipment_to_stockpile';
// Ship custom slot properties
FRONT_1_CUSTOM_SLOT_PROPERTY: 'front_1_custom_slot';
MID_1_CUSTOM_SLOT_PROPERTY: 'mid_1_custom_slot';
REAR_1_CUSTOM_SLOT_PROPERTY: 'rear_1_custom_slot';
FRONT_2_CUSTOM_SLOT_PROPERTY: 'front_2_custom_slot';
MID_2_CUSTOM_SLOT_PROPERTY: 'mid_2_custom_slot';
REAR_2_CUSTOM_SLOT_PROPERTY: 'rear_2_custom_slot';
MID_3_CUSTOM_SLOT_PROPERTY: 'mid_3_custom_slot';
// Terrain modifiers
FORT_TERRAIN_NAME: 'fort' -> pushMode(TerrainModifier);
// MTTH properties
COUNTRY_PROPERTY: 'country';
ADD: 'add';
TAG: 'tag';
IF: 'if';
ELSE: 'else';
LIMIT: 'limit';
RULE: 'rule';
OPTION: 'option';
ENABLED: 'ENABLED';
DISABLED: 'DISABLED';
HAS_GAME_RULE: 'has_game_rule';
SET_TEMP_VARIABLE: 'set_temp_variable';

EQ: '=';
OPEN_BRACE: '{';
CLOSE_BRACE: '}';
fragment DIGIT: [0-9];
FLOAT: DIGIT+ '.' DIGIT+;
fragment MINUS: '-';
INT: MINUS? DIGIT+;
YES: 'yes';
NO: 'no';
DOT: '.';

fragment CHARACTER: [a-zA-Z_] | DOT | DIGIT;
WORD: CHARACTER+;

START_BLOCK: WS* EQ WS* OPEN_BRACE WS*;
QUOTE: '"' -> pushMode(InsideStringLiteral);

mode RequirementBlock;
WS_IN_RESOURCES_BLOCK: WS -> skip;
ENDLINE_IN_REQUIREMENT_BLOCK: ENDLINE -> skip;
REQUIREMENT_NAME: CHARACTER+;
ASSIGNMENT_OPERATOR: EQ -> type(EQ);
REQUIRED_QUANTITY: INT -> type(INT);
END_REQUIREMENT_BLOCK: CLOSE_BRACE -> type(CLOSE_BRACE), popMode;

mode TerrainModifier;
START_TERRAIN_BLOCK :START_BLOCK -> type(START_BLOCK);
ATTACK_MODIFIER_PROPERTY: 'attack';
MOVEMENT_MODIFIER_PROPERTY: 'movement';
MODIFIER_VALUE: FLOAT -> type(FLOAT);
ASSIGNMENT_TERRAIN_MDOFIER: EQ -> type(EQ);
WHITESPACE_IN_TERRAIN_BLOCK: WS -> skip;
ENDLINE_IN_TERRAIN_BLOCK: ENDLINE -> skip;
END_TERRAIN_MDOFIEIR_BLOCK: CLOSE_BRACE -> type(CLOSE_BRACE), popMode;

mode GroupByDeclaration;
GROUP_BY_DECLARATION: EQ -> type(EQ);
GROUP_BY_VALUE: CHARACTER+ -> popMode;
WHITESPACE_GROUP_BY: WS -> skip;
ENDLINE_GROUP_BY: ENDLINE -> skip;

mode InsideStringLiteral;
INSIDE_STRING: ~('"')*;
CLOSE_QUOTE: QUOTE -> popMode;