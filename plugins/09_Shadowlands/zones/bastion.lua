-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Map = ns.Map
local isinstance = ns.isinstance

local Rare = ns.node.Rare
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Pet = ns.reward.Pet
local Transmog = ns.reward.Transmog
local Toy = ns.reward.Toy

local Path = ns.poi.Path
local POI = ns.poi.POI

local options = ns.options.args.VisibilityGroup.args
local defaults = ns.optionDefaults.profile

-------------------------------------------------------------------------------

local KYRIAN = ns.covenants.KYR

------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({ id=1533 })
local nodes = map.nodes

function map:enabled (node, coord, minimap)
    if not Map.enabled(self, node, coord, minimap) then return false end

    if node == map.intro then return true end

    -- add rlabel and warning if covenant doesn't match
    ns.processCovenant(node)

    local profile = ns.addon.db.profile
    if isinstance(node, Rare) then return profile.rare_bastion end
    if isinstance(node, Treasure) then return profile.treasure_bastion end
    return true
end

-------------------------------------------------------------------------------
----------------------------------- OPTIONS -----------------------------------
-------------------------------------------------------------------------------

defaults['rare_bastion'] = true
defaults['treasure_bastion'] = true

options.groupBastion = {
    type = "header",
    name = C_Map.GetMapInfo(map.id).name,
    order = 10,
}

options.rareBastion = {
    type = "toggle",
    arg = "rare_bastion",
    name = L["options_toggle_rares"],
    desc = L["options_toggle_rares_desc"],
    order = 11,
    width = "normal",
}

options.treasureBastion = {
    type = "toggle",
    arg = "treasure_bastion",
    name = L["options_toggle_treasures"],
    desc = L["options_toggle_treasures_desc"],
    order = 12,
    width = "normal",
}

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

nodes[32592336] = Rare({
    id=171211,
    quest=61083,
    requires='{item:180613}',
    note=L["aspirant_eolis_note"],
    rewards={
        Achievement({id=14307, criteria=48844}),
        Transmog({item=183607, slot=L["polearm"]}) -- Uncertain Aspirant's Spear
    },
    pois={
        POI({32322113, 32762034}) -- Fragile Humility Scroll
    }
}) -- Aspirant Eolis

nodes[51344080] = Rare({
    id=160629,
    quest=nil,
    note=L["activation_unknown"],
    rewards={
        Achievement({id=14307, criteria=48828})
    }
}) -- Baedos

nodes[48985031] = Rare({
    id=170659,
    quest={60897,62158},
    note=L["basilofos_note"],
    rewards={
        Achievement({id=14307, criteria=48833}),
        Toy({item=182655}) -- Hill King's Roarbox
    }
}) -- Basilofos, King of the Hill

nodes[55358024] = Rare({
    id=161527,
    quest=nil,
    label=L["beasts_of_bastion"],
    note=L["activation_unknown"],
    rewards={
        Achievement({id=14307, criteria={48825,48826,48827}}),
        Toy({item=174445}), -- Glimmerfly Cocoon
        Transmog({item=179485, slot=L["dagger"]}), -- Fang of Nemaeus
        Transmog({item=179486, slot=L["1h_mace"]}), -- Sigilback's Smashshell
        Transmog({item=179487, slot=L["warglaive"]}), -- Aethon's Horn
        Transmog({item=179488, slot=L["fist"]}), -- Cloudtail's Paw
    }
}) -- Beasts of Bastion

nodes[55826249] = Rare({
    id=171189,
    quest={59022,62167},
    note=L["bookkeeper_mnemis_note"],
    rewards={
        Achievement({id=14307, criteria=48843}),
        Item({item=182682, note=L["trinket"]}) -- Book-Borrower Identification
    }
}) -- Bookkeeper Mnemis

nodes[50435804] = Rare({
    id=170932,
    quest={60978,62191},
    note=L["cloudfeather_patriarch_note"],
    rewards={
        Achievement({id=14307, criteria=48835}),
        Pet({item=180812, id=2925}) -- Golden Teroclaw
    }
}) -- Cloudfeather Patriarch

nodes[66004367] = Rare({
    id=171014,
    quest=61002,
    note=L["collector_astor_note"],
    rewards={
        Achievement({id=14307, criteria=48841})
    },
    pois={
        POI({
            -- 66194411, Mercia's Legacy: Chapter One
            -- 65904411, Mercia's Legacy: Chapter Two
            -- 65734396, Mercia's Legacy: Chapter Three
            -- 65734345, Mercia's Legacy: Chapter Four
            -- 65934316, Mercia's Legacy: Chapter Five
            -- 66204327, Mercia's Legacy: Chapter Six
            64174218 -- Mercia's Legacy: Chapter Seven
        })
    }
}) -- Collector Astorestes

nodes[56904778] = Rare({
    id=171010,
    quest=60999,
    requires="{item:180651}",
    note=L["corrupted_clawguard_note"],
    rewards={
        Achievement({id=14307, criteria=48846})
    },
    pois={
        POI({55004125}) -- Forgefire Outpost
    }
}) -- Corrupted Clawguard

nodes[27823014] = Rare({
    id=170623,
    quest=60883,
    note=L["dark_watcher_note"],
    rewards={
        Achievement({id=14307, criteria=48834})
        -- also dropped class-specific finesse conduits
    }
}) -- Dark Watcher

nodes[37004180] = Rare({
    id=171011,
    quest={61069,61000},
    note=L["demi_hoarder_note"],
    rewards={
        Achievement({id=14307, criteria=48842})
    },
    pois={
        Path({
            37004180, 37714171, 37944069, 38484042, 39004077, 39354145,
            39854155, 40334106, 40424024, 40733931, 41233883
        })
    }
}) -- Demi the Relic Hoarder

nodes[41354887] = Rare({
    id=163460,
    quest=62650,
    note=L["in_small_cave"]..' '..L["dionae_note"],
    rewards={
        Achievement({id=14307, criteria=48831})
    }
}) -- Dionae

nodes[45546459] = Rare({
    id=171255,
    quest={61082,61091,62251},
    rewards={
        Achievement({id=14307, criteria=48845}),
        Item({item=180062}) -- Heavenly Drum
    },
    pois={
        Path({45546459, 44656486, 44766596, 45366670, 45866643, 45616562})
    }
}) -- Echo of Aella <Hand of Courage>

nodes[56111447] = Rare({
    id=171013,
    quest=nil,
    rewards={
        Achievement({id=14307, criteria=48838})
    }
}) -- Embodied Hunger

nodes[51151953] = Rare({
    id=171009,
    quest=60998,
    rewards={
        Achievement({id=14307, criteria=48836})
    },
    pois={
        Path({
            51151953, 50761914, 50681837, 50731769, 50931703, 51351673,
            51881686, 52251724, 52451799, 52351868, 52051918, 51651962,
            51151953
        })
    }
}) -- Enforcer Aegeon

nodes[60427305] = Rare({
    id=160721,
    quest=58222,
    rewards={
        Achievement({id=14307, criteria=48824}),
        Transmog({item=180444, slot=L["leather"]}) -- Harmonia's Chosen Belt
    },
    pois={
        Path({60137285, 60427305, 60597376})
    }
}) -- Fallen Acolyte Erisne

nodes[42908265] = Rare({
    id=158659,
    quest={57705,57708},
    note=L["herculon_note"],
    requires="{item:172451} x10",
    rewards={
        Achievement({id=14307, criteria=48823})
    }
}) -- Herculon

nodes[51456859] = Rare({
    id=160882,
    quest=58319,
    note=L["nikara_note"],
    rewards={
        Achievement({id=14307, criteria=48830}),
        Transmog({item=183608, slot=L["offhand"]}) -- Evernote Vesper
    }
}) -- Nikara Blackheart

nodes[30365517] = Rare({
    id=171327,
    quest=nil,
    note=L["activation_unknown"]
}) -- Reekmonger

nodes[61409050] = Rare({
    id=170548,
    quest=nil,
    note=L["activation_unknown"],
    rewards={
        Achievement({id=14307, criteria=48832})
    },
    pois={
        Path({
            58209700, 61009560, 61609340, 61409050,
            61708710, 62808430, 62508060, 61107910
        }),
        POI({60049398}) -- Buff?
    }
}) -- Sundancer

nodes[43482524] = Rare({
    id=171008,
    quest=60997,
    note=L["unstable_memory_note"],
    rewards={
        Achievement({id=14307, criteria=48837})
    }
}) -- Unstable Memory

nodes[40705290] = Rare({
    id=167078,
    quest=nil,
    note=L["activation_unknown"],
    rewards={
        Achievement({id=14307, criteria=48829}),
        Item({item=182749}) -- Regurgitated Kyrian Wings
    },
    pois={
        POI({41635452})
    }
}) -- Wingflayer the Cruel

nodes[48004290] = Rare({
    id=171041,
    quest=61047,
    rewards={
        Achievement({id=14307, criteria=48840}),
        Transmog({item=183605, slot=L["warglaive"]}) -- Devourer Wrought Warglaive
    },
    pois={
        POI({48004290, 52013263, 56111447})
    }
}) -- Worldfeaster Chronn

nodes[63503590] = Rare({
    id=171040,
    quest=61046,
    rewards={
        Achievement({id=14307, criteria=48839}),
        Transmog({item=183605, slot=L["warglaive"]}) -- Devourer Wrought Warglaive
    }
}) -- Xixin the Ravening

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- Treasure of Courage (27051932)
-- Treasure of Purity (26852473)
-- Treasure of Humility (24662039)
-- Treasure of Wisdom (23652548)

nodes[46114536] = Treasure({
    quest=61006,
    note=L["in_cave"],
    rewards={
        Achievement({id=14311, criteria=50053})
    }
}) -- Abandoned Stockpile

nodes[35834811] = Treasure({
    quest=61053,
    requires="{item:180536}",
    note=L["broken_flute"],
    rewards={
        Achievement({id=14311, criteria=50055}),
        Item({item=180064}) -- Ascended Flute
    }
}) -- Broken Flute

nodes[51471795] = Treasure({
    quest=61052,
    requires="{item:180534}",
    note=L["experimental_construct_part"],
    rewards={
        Achievement({id=14311, criteria=50054}),
        Transmog({item=183609, slot=L["fist"]}) -- Re-Powered Golliath Fists
    },
    pois={
        POI({53541715, 53141903}) -- Unstable Anima Core
    }
}) -- Experimental Construct Part

nodes[35085805] = Treasure({
    quest=60893,
    requires="{spell:333063}",
    note=L["gift_of_agthia"],
    rewards={
        Achievement({id=14311, criteria=50058}),
        Item({item=180063}) -- Unearthly Chime
    },
    pois={
        Path({39085448, 38455706, 37405674, 37115684, 35165822})
    }
}) -- Gift of Agthia

nodes[70473645] = Treasure({
    quest=60892,
    requires="{spell:333045}",
    note=L["gift_of_chyrus"],
    rewards={
        Achievement({id=14311, criteria=50060})
    },
    pois={
        POI({69374031, scale=0.75})
    }
}) -- Gift of Chyrus

nodes[27602179] = Treasure({
    quest=60895,
    requires="{spell:333070}",
    note=L["gift_of_devos"],
    rewards={
        Achievement({id=14311, criteria=50062}),
        Item({item=179977}) -- Benevolent Gong
    },
    pois={
        Path({
            23932482, 24712512, 25232402, 25832329, 25792226, 25192140,
            25732097, 26552137, 27122130, 27102031, 27452003, 27702102,
            27602179
        }) -- Suggested path
    }
}) -- Gift of Devos

nodes[40601890] = Treasure({
    quest=60894,
    requires="{spell:333068}",
    note=L["gift_of_thenios"],
    rewards={
        Achievement({id=14311, criteria=50061})
    }
}) -- Gift of Thenios

nodes[64877114] = Treasure({
    quest=60890,
    requires="{spell:332785}",
    note=L["gift_of_vesiphone"],
    rewards={
        Achievement({id=14311, criteria=50059}),
        Pet({item=180859, id=2935}) -- White Vulpin
    }
}) -- Gift of Vesiphone

nodes[58233999] = Treasure({
    quest=61049,
    note=L["larion_harness"],
    rewards={
        Achievement({id=14311, criteria=50051}),
        Item({item=182652})
    }
}) -- Larion Tamer's Harness

nodes[59336092] = Treasure({
    quest=61048,
    rewards={
        Achievement({id=14311, criteria=50050}),
        Item({item=182693, quest=62170}) -- You'll Never Walk Alone
    }
}) -- Lost Disciple's Notes

nodes[56481714] = Treasure({
    quest=61150,
    requires="{item:180797}",
    note=L["memorial_offering"],
    rewards={
        Achievement({id=14311, criteria=50056})
    },
    pois={
        POI({
            56851899, -- Drink Tray
        })
    }
}) -- Memorial Offering
--Kobri coordinate 47967389

nodes[52038607] = Treasure({
    quest=58329,
    rewards={
        Achievement({id=14311, criteria=50049}),
        Item({item=174007})
    }
}) -- Purifying Draught

-- 58292 (purians), 58294 (first offer), 58293 (second offer)
nodes[53508037] = Treasure({
    quest=58298,
    note=L["scroll_of_aeons"],
    rewards={
        Achievement({id=14311, criteria=50047}),
        Toy({item=173984}) -- Scroll of Aeons
    },
    pois={
        POI({54428387, 56168305})
    }
}) -- Scroll of Aeons

nodes[40504980] = Treasure({
    quest=61044,
    rewards={
        Achievement({id=14311, criteria=50052}),
        Transmog({item=182561, slot=L["cloak"]}) -- Fallen Disciple's Cloak
    }
}) -- Stolen Equipment

nodes[36012652] = Treasure({
    quest=nil,
    requires="{item:180858}",
    note=L["requirement_not_found"],
    rewards={
        Achievement({id=14311, criteria=50057})
    }
}) -- Vesper of the Silver Wind

nodes[58667135] = Treasure({
    quest=60478,
    rewards={
        Achievement({id=14311, criteria=50048}),
        Item({item=179982}) -- Kyrian Bell
    }
}) -- Vesper of Virtues

-------------------------------------------------------------------------------
----------------------------- ANIMA CRYSTAL SHARDS ----------------------------
-------------------------------------------------------------------------------

-- 61048566 61244
-- 54025967 61251
-- 65254288 61271
-- 31002747 61291
-- 30612373 61292
-- 26152262 61294
-- 24371821 61295

-------------------------------------------------------------------------------

ns.maps[map.id] = map
