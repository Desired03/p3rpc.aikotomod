-- Event_Main_200_150_C
-- 12/2 Dark Hour - Aftermath of Aigis' fight against Ryoji
-- Changes: restoration of Makoto holding Aigis' hand

local PATH_aegis_skelComp_Main_200_150_C = "/Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.BP_Event_PC0007_C_0.CharacterMesh0"
local PATH_makoto_skelComp_Main_200_150_C = "/Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.BP_Event_PC0001_C_0.CharacterMesh0"

local PATH_aegis_AppCharComp_Main_200_150_C = "/Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.BP_Event_PC0007_C_0.AppCharacterComp"
local PATH_makoto_AppCharComp_Main_200_150_C = "/Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.BP_Event_PC0001_C_0.AppCharacterComp"

local PATH_cineCamera_Main_200_150_C = "/Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.CineCameraActor_0.CameraComponent"

local PATH_LSPlayer_Main_200_150_C = "/Game/Xrd777/Events/Cinema/Event_Main_200_150_C/LV_Event_Main_200_150_C.LV_Event_Main_200_150_C:PersistentLevel.LS_Event_Main_200_150_C.AnimationPlayer"

local PATH_aegis_bridgeCrouch = "/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0562_BASE_Main_200_150.A_PC0007_EVC0562_BASE_Main_200_150"
local PATH_makoto_bridgeCrouch = "/Game/Xrd777/Characters/Player/PC0001/AnmEventsBC/A_PC0001_EVC0564_BASE_Main_200_150.A_PC0001_EVC0564_BASE_Main_200_150"
local PATH_aegis_bridgeCrouchPose = "/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0589_BASE_Main_200_150.A_PC0007_EVC0589_BASE_Main_200_150"
local PATH_makoto_bridgeCrouchPose = "/Game/Xrd777/Characters/Player/PC0001/AnmEventsBC/A_PC0001_EVC0565_BASE_Main_200_150.A_PC0001_EVC0565_BASE_Main_200_150"
local PATH_aegis_bridgeCrouchSlump = "/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0563_BASE_Main_200_150.A_PC0007_EVC0563_BASE_Main_200_150"
local PATH_makoto_bridgeCrouchSlump = "/Game/Xrd777/Characters/Player/PC0001/AnmEventsBC/A_PC0001_EVC0566_BASE_Main_200_150.A_PC0001_EVC0566_BASE_Main_200_150"

local Frames = {}
Frames[150] = function(Sequencer)
    Sequencer.InterceptState = 1

    local LSPlayer = StaticFindObject(PATH_LSPlayer_Main_200_150_C)
    LSPlayer:Pause()
    LSPlayer:JumpToSeconds(6.3) -- Frame 189. This changes the camera angle. WHY?!

    local makoto_skelComp = StaticFindObject(PATH_makoto_skelComp_Main_200_150_C)
    local aegis_AppCharComp = StaticFindObject(PATH_aegis_AppCharComp_Main_200_150_C)

    local aegis_drawHand = StaticFindObject("/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0561_BASE_Main_200_150.A_PC0007_EVC0561_BASE_Main_200_150")
    local aegis_drawHand_montage = aegis_AppCharComp:PlayAnim_DefaultSlot(aegis_drawHand, true, 0.2, 0.2, 1.0)
    makoto_skelComp:K2_SetWorldLocationAndRotation(
        {X = -217.5695, Y = -3199.0178, Z = 279.0000},
        {Pitch = 0.0000, Yaw = 38.4771, Roll = 0.0000},
        false,
        {},
        true
    )
    
    LSPlayer:Play()
    
    ExecuteWithDelay(2900, function()
        ExecuteInGameThread(function()
            aegis_AppCharComp:PauseAnim(true, aegis_drawHand_montage)
            aegis_AppCharComp:PlayAnim_DefaultSlot(StaticFindObject("/Game/Xrd777/Characters/Player/PC0007/AnmEventsBC/A_PC0007_EVC0588_BASE_Main_200_150.A_PC0007_EVC0588_BASE_Main_200_150"), true, 0.2, 0.2, 1.0)
        end)
    end)
end

Frames[190] = function(Sequencer)
    Sequencer.InterceptState = 1

    local LSPlayer = StaticFindObject(PATH_LSPlayer_Main_200_150_C)
    LSPlayer:Pause()

    local aegis_AppCharComp = StaticFindObject(PATH_aegis_AppCharComp_Main_200_150_C)
    local makoto_AppCharComp = StaticFindObject(PATH_makoto_AppCharComp_Main_200_150_C)
    
    local aegis_bridgeCrouch_montage = aegis_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_aegis_bridgeCrouch), true, 0.5, 0.5, 1.0)
    local makoto_bridgeCrouch_montage = makoto_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_makoto_bridgeCrouch), true, 0.5, 0.5, 1.0)

    makoto_AppCharComp:PlayFaceAnimation(3, true, 1.0, 1.0, 1.0)

    ExecuteWithDelay(1900, function()
        ExecuteInGameThread(function()
            aegis_AppCharComp:PauseAnim(true, aegis_bridgeCrouch_montage)
            makoto_AppCharComp:PauseAnim(true, makoto_bridgeCrouch_montage)
        end)
    end)

    ExecuteWithDelay(3000, function()
        ExecuteInGameThread(function()
            aegis_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_aegis_bridgeCrouchPose), true, 0.5, 0.5, 1.0)
            makoto_AppCharComp:PlayAnim_DefaultSlot(LoadAsset(PATH_makoto_bridgeCrouchPose), true, 0.5, 0.5, 1.0)

            LSPlayer:JumpToSeconds(7.97) -- Frame 239
            LSPlayer:Play()
        end)
    end)
end

Frames[470] = function(Sequencer)
    Sequencer.InterceptState = 1

    local LSPlayer = StaticFindObject(PATH_LSPlayer_Main_200_150_C)
    LSPlayer:Pause()
    LSPlayer:PlayToSeconds(16.34) -- Frame 490

    local CCamera = StaticFindObject(PATH_cineCamera_Main_200_150_C)
    CCamera:K2_SetWorldLocationAndRotation(
        {X = -427.8014, Y = -3367.6074, Z = 438.3165},
        {Pitch = -18.6191, Yaw = 52.4429, Roll = 0.0000},
        false,
        {},
        true
    )

    local aegis_AppCharComp = StaticFindObject(PATH_aegis_AppCharComp_Main_200_150_C)
    local makoto_AppCharComp = StaticFindObject(PATH_makoto_AppCharComp_Main_200_150_C)

    local makoto_skelComp = StaticFindObject(PATH_makoto_skelComp_Main_200_150_C)
    makoto_skelComp:K2_SetWorldLocationAndRotation(
        {X = -217.5695, Y = -3199.0178, Z = 279.0000},
        {Pitch = 0.0000, Yaw = 38.4771, Roll = 0.0000},
        false,
        {},
        true
    )
    
    local aegis_bridgeCrouchSlump = LoadAsset(PATH_aegis_bridgeCrouchSlump)
    local makoto_bridgeCrouchSlump = LoadAsset(PATH_makoto_bridgeCrouchSlump)

    local aegis_bridgeCrouchSlump_montage = aegis_AppCharComp:PlayAnim_DefaultSlot(aegis_bridgeCrouchSlump, true, 0.2, 0.1, 1.0)
    local makoto_bridgeCrouchSlump_montage = makoto_AppCharComp:PlayAnim_DefaultSlot(makoto_bridgeCrouchSlump, true, 0.2, 0.1, 1.0)

    makoto_AppCharComp:PlayFaceAnimation(4, true, 0.4, 0.4, 1.0)

    -- believe me I didn't want to do it like this
    ExecuteWithDelay(2600, function()
        ExecuteInGameThread(function()
            aegis_AppCharComp:PauseAnim(true, aegis_bridgeCrouchSlump_montage)
        end)
    end)

    ExecuteWithDelay(2700, function()
        ExecuteInGameThread(function()
            makoto_AppCharComp:PauseAnim(true, makoto_bridgeCrouchSlump_montage)
        end)
    end)

    ExecuteWithDelay(3200, function()
        ExecuteInGameThread(function()
            makoto_AppCharComp:PlayFaceAnimation(3, true, 1.0, 1.0, 1.0)
            makoto_AppCharComp:PlayAnim_DefaultSlot(StaticFindObject("/Game/Xrd777/Characters/Player/PC0001/AnmEventsBC/A_PC0001_EVC0123_BASE_Main_120_210.A_PC0001_EVC0123_BASE_Main_120_210"), true, 0.5, 0.1, 1.0)

            LSPlayer:JumpToSeconds(18.3) -- Frame 549 (sorry Fuuka)
            LSPlayer:Play()
        end)
    end)
end

Frames[570] = function(Sequencer)
    local CCamera = StaticFindObject(PATH_cineCamera_Main_200_150_C)
    CCamera:K2_SetWorldLocationAndRotation(
        {X = -598.1973, Y = -2636.2178, Z = 364.3143},
        {Pitch = 0.2656, Yaw = -55.7063, Roll = 0.0000},
        false,
        {},
        true
    )

    local makoto_skelComp = StaticFindObject(PATH_makoto_skelComp_Main_200_150_C)
    makoto_skelComp:K2_SetWorldLocationAndRotation(
        {X = -186.0001, Y = -3140.0000, Z = 277.7555},
        {Pitch = 0.0000, Yaw = 152.6925, Roll = 0.0000},
        false,
        {},
        true
    )
end

return Frames