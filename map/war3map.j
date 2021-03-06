globals
//globals from Base:
constant boolean LIBRARY_Base=true
//endglobals from Base

trigger l__library_init

//JASSHelper struct globals:

endglobals


//library Base:
    
    function Base__Init takes nothing returns nothing
        call Cheat("exec-lua:lua.base")
    endfunction
    

//library Base ends
//===========================================================================
// 
// 只是另外一张魔兽争霸的地图
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Wed Sep 12 14:56:35 2018
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
    local integer itemID
    call CreateItem('texp', - 190.3, 255.4)
    call CreateItem('texp', - 151.1, 160.7)
    call CreateItem('texp', - 260.9, 175.1)
    call CreateItem('texp', - 356.8, 252.3)
    call CreateItem('texp', - 429.6, 249.3)
    call CreateItem('texp', - 500.1, 207.3)
    call CreateItem('texp', - 510.9, 175.1)
    call CreateItem('texp', - 560.6, 132.2)
    call CreateItem('texp', - 450.3, 140.7)
    call CreateItem('texp', - 542.0, 93.3)
    call CreateItem('texp', - 480.3, 82.3)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hmpr', - 301.9, 72.3, 47.670)
    call UnitAddItemToSlotById(u, 'pghe', 0)
    set u=CreateUnit(p, 'Hpal', 1552.8, 2477.7, 279.547)
    set u=CreateUnit(p, 'hmpr', 20.6, 285.0, 155.417)
    set u=CreateUnit(p, 'Hpal', 25.1, 23.3, 233.460)
    call UnitAddItemToSlotById(u, 'desc', 0)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreateUnitsForPlayer0() // INLINED!!
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
//TESH.scrollpos=0
//TESH.alwaysfold=0
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_002
    call SetPlayerTeam(Player(0), 0)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("Base__Init")

    call InitGlobals()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("只是另外一张魔兽争霸的地图")
    call SetMapDescription("没有说明")
    call SetPlayers(1)
    call SetTeams(1)
    call SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    call DefineStartLocation(0, - 1344.0, - 2560.0)
    // Player setup
    call InitCustomPlayerSlots()
    call SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    call InitGenericPlayerSlots()
endfunction




//Struct method generated initializers/callers:

