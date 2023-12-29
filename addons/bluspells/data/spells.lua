local traits = {
    None = nil,
    BeastKiller = "Beast Killer",
    LizardKiller = "Lizard Killer",
    UndeadKiller = "Undead Killer",
    PlantoidKiller = "Plantoid Killer",
    ResistSleep = "Resist Sleep",
    ResistSilence = "Resist Silence",
    ResistGravity = "Resist Gravity",
    AccuracyBonus = "Accuracy Bonus",
    AttackBonus = "Attack Bonus",
    AutoRefresh = "Auto Refresh",
    AutoRegen = "Auto Regen",
    ClearMind = "Clear Mind",
    ConserveMp = "Conserve MP",
    Counter = "Counter",
    CriticalAttackBonus = "Critical Attack Bonus",
    DefenseBonus = "Defense Bonus",
    MultiAttack = "Multi-Attack",
    DualWield = "Dual Wield",
    EvasionBonus = "Evasion Bonus",
    FastCast = "Fast Cast",
    TreasureHunter = "Treasure Hunter",
    Inquartata = "Inquartata",
    MagicAccuracyBonus = "Magic Accuracy Bonus",
    MagicAttackBonus = "Magic Attack Bonus",
    MagicBurstBonus = "Magic Burst Bonus",
    MagicDefenseBonus = "Magic Defense Bonus",
    MagicEvasionBonus = "Magic Evasion Bonus",
    MaxHpBoost = "Max HP Boost",
    MaxMpBoost = "Max MP Boost",
    RapidShot = "Rapid Shot",
    SkillchainBonus = "Skillchain Bonus",
    StoreTp = "Store TP",
    Tenacity = "Tenacity",
    Zanshin = "Zanshin",
}

local damage = {
    HandToHand = "Hand-to-Hand",
    Slashing = "Slashing",
    Piercing = "Piercing",
    Ranged = "Ranged",
    Breath = "Breath",
    Blunt = "Blunt",
    Magic = "Magic",
    Cure = "Cure",
}

local element = {
    None = nil,
    Light = "Light",
    Dark = "Dark",
    Lightning = "Lightning",
    Earth = "Earth",
    Wind = "Wind",
    Ice = "Ice",
    Fire = "Fire",
    Water = "Water",
}

local monType = {
    Beast = "Beast",
    Lizard = "Lizard",
    Vermin = "Vermin",
    Plantoid = "Plantoid",
    Amorph = "Amorph",
    Bird = "Bird",
    Aquan = "Aquan",
    Undead = "Undead",
    Arcana = "Arcana",
    Demon = "Demon",
    Dragon = "Dragon",
    Beastmen = "Beastmen",
    Empty = "Empty",
    Luminian = "Luminian",
    Luminion = "Luminion",
    Voragean = "Voragean",
    Archaic = "Archaic",
    Elemental = "Elemental",
}

local monFamily = {
    -- beasts
    Behemoth = "Behemoth",
    Buffalo = "Buffalo",
    Cehuetzi = "Cehuetzi",
    Cerberus = "Cerberus",
    Coeurl = "Coeurl",
    Dhalmel = "Dhalmel",
    Gnole = "Gnole",
    Manticore = "Manticore",
    Marid = "Marid",
    OpoOpo = "Opo-opo",
    Raaz = "Raaz",
    Rabbit = "Rabbit",
    Ram = "Ram",
    Sheep = "Sheep",
    Tiger = "Tiger",
    Yztarg = "Yztarg",
    -- lizards
    Adamantoise = "Adamantoise",
    Bugard = "Bugard",
    Eft = "Eft",
    Gabbrath = "Gabbrath",
    HillLizard = "Hill Lizard",
    Matamata = "Matamata",
    Peiste = "Peiste",
    Raptor = "Raptor",
    Wivre = "Wivre",
    -- vermin
    Antlion = "Antlion",
    Bee = "Bee",
    Beetle = "Beetle",
    Bztavian = "Bztavian",
    Chapuli = "Chapuli",
    Chigoe = "Chigoe",
    Crawler = "Crawler",
    Diremite = "Diremite",
    Fly = "Fly",
    Gnat = "Gnat",
    Ladybug = "Ladybug",
    Mantid = "Mantid",
    Mosquito = "Mosquito",
    Scorpion = "Scorpion",
    Spider = "Spider",
    Twitherym = "Twitherym",
    Wamoura = "Wamoura",
    Wamouracampa = "Wamouracampa",
    -- plantoid
    Belladonna = "Belladonna",
    Flytrap = "Flytrap",
    Funguar = "Funguar",
    Goobbue = "Goobbue",
    Leafkin = "Leafkin",
    Mandragora = "Mandragora",
    Morbol = "Morbol",
    Panopt = "Panopt",
    Rafflesia = "Rafflesia",
    Sabotender = "Sabotender",
    Sapling = "Sapling",
    Snapweed = "Snapweed",
    Treant = "Treant",
    Yggdreant = "Yggdreant",
    -- amorph
    Acuex = "Acuex",
    Botulus = "Botulus",
    Flan = "Flan",
    Hecteyes = "Hecteyes",
    Leech = "Leech",
    Plovid = "Plovid",
    Sandworm = "Sandworm",
    Slime = "Slime",
    Slug = "Slug",
    Worm = "Worm",
    -- bird
    Amphiptere = "Amphiptere",
    Apkallu = "Apkallu",
    Bat = "Bat",
    Cockatrice = "Cockatrice",
    Colibri = "Colibri",
    FlockBat = "Flock Bat",
    GreaterBird = "Greater Bird",
    Harpeia = "Harpeia",
    Hippogryph = "Hippogryph",
    LesserBird = "Lesser Bird",
    Tulfaires = "Tulfaires",
    Waktza = "Waktza",
    -- aquan
    Crab = "Crab",
    Craklaw = "Craklaw",
    Frog = "Frog",
    Orobon = "Orobon",
    Pteraketos = "Pteraketos",
    Pugil = "Pugil",
    Rockfin = "Rockfin",
    SeaMonk = "Sea Monk",
    Ruszor = "Ruszor",
    Uragnite = "Uragnite",
    -- undead
    Corpselight = "Corpselight",
    Corse = "Corse",
    Doomed = "Doomed",
    Dullahan = "Dullahan",
    Fomor = "Fomor",
    Ghost = "Ghost",
    Hound = "Hound",
    Naraka = "Naraka",
    Qutrub = "Qutrub",
    Skeleton = "Skeleton",
    Vampyr = "Vampyr",
    -- arcana
    Acrolith = "Acrolith",
    Bomb = "Bomb",
    Cardian = "Cardian",
    Caturae = "Caturae",
    Cluster = "Cluster",
    Detector = "Detector",
    Doll = "Doll",
    EvilWeapon = "Evil Weapon",
    Golem = "Golem",
    Grimoire = "Grimoire",
    IronGiant = "Iron Giant",
    Khimaira = "Khimaira",
    MagicPot = "Magic Pot",
    Marolith = "Marolith",
    Mimic = "Mimic",
    Snoll = "Snoll",
    -- demon
    Ahriman = "Ahriman",
    Defiant = "Defiant",
    Demon = "Demon",
    Dvergr = "Dvergr",
    Gallu = "Gallu",
    Gargouille = "Gargouille",
    Imp = "Imp",
    Macuil = "Macuil",
    Soulflayer = "Soulflayer",
    Taurus = "Taurus",
    -- dragon
    Dragon = "Dragon",
    Hydra = "Hydra",
    Puk = "Puk",
    Wyrm = "Wyrm",
    Wyvern = "Wyvern",
    Zilant = "Zilant",
    -- beastmen
    Antica = "Antica",
    Bugbear = "Bugbear",
    Gigas = "Gigas",
    Goblin = "Goblin",
    Lamiae = "Lamiae",
    MamoolJa = "Mamool Ja",
    Meeble = "Meeble",
    Orc = "Orc",
    OrcishWarmachine = "Orcish Warmachine",
    Poroggo = "Poroggo",
    Qiqirn = "Qiqirn",
    Quadav = "Quadav",
    Sahagin = "Sahagin",
    SiegeTurret = "Siege Turret",
    Tonberry = "Tonberry",
    Troll = "Troll",
    Velkk = "Velkk",
    Yagudo = "Yagudo",
    -- empty
    Craver = "Craver",
    Gorger = "Gorger",
    Receptacle = "Receptacle",
    Seether = "Seether",
    Thinker = "Thinker",
    Wanderer = "Wanderer",
    Weeper = "Weeper",
    -- luminian
    Aern = "Aern",
    Euvhi = "Euvhi",
    Hpemde = "Hpemde",
    Phuabo = "Phuabo",
    Xzomit = "Xzomit",
    Wynav = "Wynav",
    Yovra = "Yovra",
    -- luminion
    Ghrah = "Ghrah",
    Zdei = "Zdei",
    -- vorageans
    Amoeban = "Amoeban",
    Clionid = "Clionid",
    Limule = "Limule",
    Murex = "Murex",
    -- archaics
    Chariot = "Chariot",
    Gear = "Gear",
    Rampart = "Rampart",
    -- elementals
    Elemental = "Elemental",
    Heartwing = "Heartwing",
    Monoceros = "Monoceros",
    Pixie = "Pixie",
    Porxie = "Porxie",
    Umbril = "Umbril",
}

local target = {
    Self = "Self",
    Party = "Party",
    Player = "Player",
    Enemy = "Enemy",
    Any = "Any",
}

local res = {
    Light         = 'Light',
    Darkness      = 'Darkness',
    Distortion    = 'Distortion',
    Gravitation   = 'Gravitation',
    Fusion        = 'Fusion',
    Fragmentation = 'Fragmentation',
    Scission      = 'Scission',
    Compression   = 'Compression',
    Induration    = 'Induration',
    Reverberation = 'Reverberation',
    Impaction     = 'Impaction',
    Detonation    = 'Detonation',
    Liquefaction  = 'Liquefaction',
    Transfixion   = 'Transfixion',
}

local spells = {
    {
        Id = 577, Name = "Foot Kick", Cost = 2,
        Desc = "Deals critical damage. Chance of critical hit varies with TP.",
        Stats = { Agi = 1 },
        Trait = traits.LizardKiller, TraitPoints = 4,
        DamageType = damage.Slashing, Element = element.None,
        MonsterType = monType.Beast, MonsterFamily = monFamily.Rabbit,
        MpCost = 5, CastTime = 500, RecastTime = 6500,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Detonation },
        Attributes = { Str = 0.1, Dex = 0.1 },
    },
    {
        Id = 549, Name = "Pollen", Cost = 1,
        Desc = "Deals critical damage. Chance of critical hit varies with TP.",
        Notes = "Soft cap of 36 HP",
        Stats = { Hp = 5, Chr = 1 },
        Trait = traits.ResistSleep, TraitPoints = 4,
        DamageType = damage.Cure, Element = element.Light,
        MonsterType = monType.Vermin, MonsterFamily = monFamily.Bee,
        MpCost = 8, CastTime = 2000, RecastTime = 5000,
        Target = target.Self, Range = 0, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 524, Name = "Sandspin", Cost = 1,
        Desc = "Deals earth damage to enemies within range. Additional effect: Accuracy Down.",
        Notes = "Accuracy -25",
        Stats = { Vit = 1 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Earth,
        MonsterType = monType.Amorph, MonsterFamily = monFamily.Worm,
        MpCost = 10, CastTime = 1500, RecastTime = 9750,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { },
        Attributes = { Int = 0.2 },
    },
    {
        Id = 551, Name = "Power Attack", Cost = 1,
        Desc = "Deals critical damage. Chance of critical varies with TP.",
        Stats = { Mnd = 1 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Slashing, Element = element.None,
        MonsterType = monType.Vermin, MonsterFamily = monFamily.Beetle,
        MpCost = 5, CastTime = 500, RecastTime = 7250,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Reverberation },
        Attributes = { Str = 0.1, Vit = 0.1 },
    },
    {
        Id = 597, Name = "Sprout Smack", Cost = 2,
        Desc = "Additional effect: Slow. Duration of effect varies with TP.",
        Notes = "Slow +15%",
        Stats = { Mnd = 1 },
        Trait = traits.BeastKiller, TraitPoints = 4,
        DamageType = damage.Blunt, Element = element.None,
        MonsterType = monType.Plantoid, MonsterFamily = monFamily.Sapling,
        MpCost = 6, CastTime = 500, RecastTime = 7250,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Reverberation },
        Attributes = { Vit = 0.3 },
    },
    {
        Id = 603, Name = "Wild Oats", Cost = 3,
        Desc = "Additional effect: Vitality Down. Duration of effect varies with TP.",
        Notes = "VIT Down decays over time",
        Stats = { Hp = 10, Chr = 1 },
        Trait = traits.BeastKiller, TraitPoints = 4,
        DamageType = damage.Piercing, Element = element.None,
        MonsterType = monType.Plantoid, MonsterFamily = monFamily.Mandragora,
        MpCost = 9, CastTime = 500, RecastTime = 7250,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { res.Transfixion },
        Attributes = { Agi = 0.3 },
    },
    {
        Id = 547, Name = "Cocoon", Cost = 1,
        Desc = "Enhances defense.",
        Notes = "Defense +50%",
        Stats = { Vit = 3 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Earth,
        MonsterType = monType.Vermin, MonsterFamily = monFamily.Crawler,
        MpCost = 10, CastTime = 1750, RecastTime = 60000,
        Target = target.Self, Range = 0, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 517, Name = "Metallic Body", Cost = 1,
        Desc = "Absorbs a certain amount of damage from physical and magical attacks.",
        Notes = "Stoneskin caps at 200 HP",
        Stats = { },
        Trait = traits.MaxMpBoost, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Earth,
        MonsterType = monType.Aquan, MonsterFamily = monFamily.Crab,
        MpCost = 19, CastTime = 2500, RecastTime = 60000,
        Target = target.Self, Range = 0, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 599, Name = "Queasyshroom", Cost = 2,
        Desc = "Additional Effect: Poison. Duration of effect varies with TP.",
        Notes = "3 damage per tick",
        Stats = { Hp = -5, Mp = 5 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Ranged, Element = element.None,
        MonsterType = monType.Plantoid, MonsterFamily = monFamily.Funguar,
        MpCost = 20, CastTime = 2000, RecastTime = 15000,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { res.Compression },
        Attributes = { Int = 0.2 },
    },
    {
        Id = 620, Name = "Battle Dance", Cost = 3,
        Desc = "Delivers an area attack. Additional effect: DEX Down. Duration of effect varies with TP.",
        Notes = "AOE is centered on caster and removes all shadows",
        Stats = { Dex = 2 },
        Trait = traits.AttackBonus, TraitPoints = 4,
        DamageType = damage.Slashing, Element = element.None,
        MonsterType = monType.Beastmen, MonsterFamily = monFamily.Orc,
        MpCost = 12, CastTime = 1000, RecastTime = 10000,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { res.Impaction },
        Attributes = { Str = 0.3 },
    },
    {
        Id = 638, Name = "Feather Storm", Cost = 3,
        Desc = "Additional effect: Poison. Chance of effect varies with TP.",
        Notes = "? damage per tick",
        Stats = { Hp = 5, Chr = 2 },
        Trait = traits.RapidShot, TraitPoints = 4,
        DamageType = damage.Ranged, Element = element.None,
        MonsterType = monType.Beastmen, MonsterFamily = monFamily.Yagudo,
        MpCost = 12, CastTime = 500, RecastTime = 10000,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { res.Transfixion },
        Attributes = { Agi = 0.3 },
    },
    {
        Id = 623, Name = "Head Butt", Cost = 3,
        Desc = "Damage varies with TP. Additional effect: Stun.",
        Notes = "Has knockback",
        Stats = { Dex = 2 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Blunt, Element = element.None,
        MonsterType = monType.Beastmen, MonsterFamily = monFamily.Quadav,
        MpCost = 12, CastTime = 500, RecastTime = 10000,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Impaction },
        Attributes = { Str = 0.2, Int = 0.2 },
    },
    {
        Id = 581, Name = "Healing Breeze", Cost = 4,
        Desc = "Restores HP for party members within area of effect.",
        Notes = "Soft cap of 180 HP",
        Stats = { Hp = 10, Chr = 2 },
        Trait = traits.AutoRegen, TraitPoints = 4,
        DamageType = damage.Cure, Element = element.Wind,
        MonsterType = monType.Beast, MonsterFamily = monFamily.Dhalmel,
        MpCost = 55, CastTime = 4500, RecastTime = 15000,
        Target = target.Self, Range = 0, Area = 10,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 567, Name = "Helldive", Cost = 2,
        Desc = "Damage varies with TP.",
        Notes = "Has knockback",
        Stats = { Hp = 5, Chr = 1 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Slashing, Element = element.None,
        MonsterType = monType.Bird, MonsterFamily = monFamily.LesserBird,
        MpCost = 16, CastTime = 1000, RecastTime = 11250,
        Target = target.Enemy, Range = 3, Area = 10,
        Resonances = { res.Transfixion },
        Attributes = { Agi = 0.3 },
    },
    {
        Id = 584, Name = "Sheep Song", Cost = 2,
        Desc = "Puts all enemies within range to sleep.",
        Notes = "AOE is centered on caster",
        Stats = { Hp = 5, Chr = 1 },
        Trait = traits.AutoRegen, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Light,
        MonsterType = monType.Beast, MonsterFamily = monFamily.Sheep,
        MpCost = 22, CastTime = 3000, RecastTime = 60000,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 618, Name = "Blastbomb", Cost = 2,
        Desc = "Deals fire damage to enemies within area of effect. Additional Effect: Bind.",
        Notes = "Bypasses shadows",
        Stats = { Str = 1 },
        Trait = traits.None, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Fire,
        MonsterType = monType.Beastmen, MonsterFamily = monFamily.OrcishWarmachine,
        MpCost = 36, CastTime = 2250, RecastTime = 15000,
        Target = target.Enemy, Range = 12, Area = 5,
        Resonances = { },
        Attributes = { Int = 0.2 },
    },
    {
        Id = 529, Name = "Bludgeon", Cost = 2,
        Desc = "Delivers a threefold attack. Accuracy varies with TP.",
        Notes = "33% attack bonus",
        Stats = { Str = 1 },
        Trait = traits.UndeadKiller, TraitPoints = 4,
        DamageType = damage.Blunt, Element = element.None,
        MonsterType = monType.Arcana, MonsterFamily = monFamily.Cardian,
        MpCost = 16, CastTime = 500, RecastTime = 11750,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Liquefaction },
        Attributes = { Chr = 0.3 },
    },
    {
        Id = 544, Name = "Cursed Sphere", Cost = 2,
        Desc = "Deals water damage to enemies within area of effect.",
        Stats = { Mnd = 1 },
        Trait = traits.MagicAttackBonus, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Water,
        MonsterType = monType.Vermin, MonsterFamily = monFamily.Fly,
        MpCost = 36, CastTime = 3000, RecastTime = 20000,
        Target = target.Enemy, Range = 12, Area = 5,
        Resonances = { },
        Attributes = { Int = 0.3 },
    },
    {
        Id = 570, Name = "Blood Drain", Cost = 2,
        Desc = "Steals an enemy's HP. Ineffective against undead.",
        Notes = "Drain for Blue Magic Skill x 0.33",
        Stats = { Hp = -5, Mp = 5 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Dark,
        MonsterType = monType.Bird, MonsterFamily = monFamily.Bat,
        MpCost = 10, CastTime = 4000, RecastTime = 90000,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 587, Name = "Claw Cyclone", Cost = 2,
        Desc = "Damages enemies within area of effect with a twofold attack. Damage varies with TP.",
        Stats = { Vit = 1 },
        Trait = traits.LizardKiller, TraitPoints = 4,
        DamageType = damage.Slashing, Element = element.None,
        MonsterType = monType.Beast, MonsterFamily = monFamily.Tiger,
        MpCost = 24, CastTime = 1000, RecastTime = 19750,
        Target = target.Enemy, Range = 12, Area = 5,
        Resonances = { res.Scission },
        Attributes = { Dex = 0.3 },
    },
    {
        Id = 536, Name = "Poison Breath", Cost = 1,
        Desc = "Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison.",
        Notes = "Breath for 10% current HP and 4 damage per tick poison",
        Stats = { Mnd = 1 },
        Trait = traits.ClearMind, TraitPoints = 4,
        DamageType = damage.Breath, Element = element.Water,
        MonsterType = monType.Undead, MonsterFamily = monFamily.Hound,
        MpCost = 22, CastTime = 5000, RecastTime = 60000,
        Target = target.Enemy, Range = 12, Area = 5,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 598, Name = "Soporific", Cost = 4,
        Desc = "Puts all enemies within range to sleep.",
        Notes = "AOE is centered on caster",
        Stats = { Hp = -5, Mp = 5 },
        Trait = traits.ClearMind, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Dark,
        MonsterType = monType.Plantoid, MonsterFamily = monFamily.Flytrap,
        MpCost = 38, CastTime = 3000, RecastTime = 90000,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 519, Name = "Screwdriver", Cost = 3,
        Desc = "Deals critical damage. Chance of critical hit varies with TP.",
        Stats = { Hp = 10, Vit = 1, Chr = 1 },
        Trait = traits.EvasionBonus, TraitPoints = 4,
        DamageType = damage.Piercing, Element = element.None,
        MonsterType = monType.Aquan, MonsterFamily = monFamily.Pugil,
        MpCost = 21, CastTime = 500, RecastTime = 14000,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Transfixion, res.Scission },
        Attributes = { Str = 0.2, Mnd = 0.2 },
    },
    {
        Id = 626, Name = "Bomb Toss", Cost = 3,
        Desc = "Throws a bomb at an enemy.",
        Stats = { Str = 2 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Fire,
        MonsterType = monType.Beastmen, MonsterFamily = monFamily.Goblin,
        MpCost = 42, CastTime = 4000, RecastTime = 25000,
        Target = target.Enemy, Range = 12, Area = 5,
        Resonances = { },
        Attributes = { Int = 0.2 },
    },
    {
        Id = 622, Name = "Grand Slam", Cost = 2,
        Desc = "Delivers an area attack. Damage varies with TP.",
        Notes = "AOE is centered on caster",
        Stats = { Int = 1 },
        Trait = traits.DefenseBonus, TraitPoints = 4,
        DamageType = damage.Blunt, Element = element.None,
        MonsterType = monType.Beastmen, MonsterFamily = monFamily.Gigas,
        MpCost = 24, CastTime = 1000, RecastTime = 14250,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { res.Induration },
        Attributes = { Vit = 0.3 },
    },
    {
        Id = 578, Name = "Wild Carrot", Cost = 3,
        Desc = "Restores HP for the target party member.",
        Notes = "Soft cap of 180 HP",
        Stats = { Hp = 5 },
        Trait = traits.ResistSleep, TraitPoints = 4,
        DamageType = damage.Cure, Element = element.Light,
        MonsterType = monType.Beast, MonsterFamily = monFamily.Rabbit,
        MpCost = 37, CastTime = 2500, RecastTime = 6000,
        Target = target.Party, Range = 20, Area = 0, -- player or party?
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 582, Name = "Chaotic Eye", Cost = 2,
        Desc = "Silences an enemy.",
        Notes = "Enemy must be facing you",
        Stats = { Agi = 1 },
        Trait = traits.ConserveMp, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Wind,
        MonsterType = monType.Beast, MonsterFamily = monFamily.Coeurl,
        MpCost = 13, CastTime = 3000, RecastTime = 10000,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 572, Name = "Sound Blast", Cost = 2,
        Desc = "Lowers Intelligence of enemies within range.",
        Notes = "AOE is centered on caster",
        Stats = { },
        Trait = traits.MagicAttackBonus, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Fire,
        MonsterType = monType.Bird, MonsterFamily = monFamily.Cockatrice,
        MpCost = 25, CastTime = 4000, RecastTime = 30000,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 522, Name = "Death Ray", Cost = 2,
        Desc = "Deals dark damage to an enemy.",
        Stats = { Hp = -5, Mp = 5 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Dark,
        MonsterType = monType.Amorph, MonsterFamily = monFamily.Hecteyes,
        MpCost = 49, CastTime = 4500, RecastTime = 30000,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { },
        Attributes = { Int = 0.2, Mnd = 0.2 },
    },
    {
        Id = 527, Name = "Smite of Rage", Cost = 3,
        Desc = "Damage varies with TP.",
        Stats = { Agi = 3 },
        Trait = traits.UndeadKiller, TraitPoints = 4,
        DamageType = damage.Slashing, Element = element.None,
        MonsterType = monType.Arcana, MonsterFamily = monFamily.EvilWeapon,
        MpCost = 28, CastTime = 500, RecastTime = 13000,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Detonation },
        Attributes = { Str = 0.2, Dex = 0.2 },
    },
    {
        Id = 542, Name = "Digest", Cost = 2,
        Desc = "Steals an enemy's HP. Ineffective against undead.",
        Notes = "Drain for Blue Magic Skill x 0.55",
        Stats = { Hp = -5, Mp = 5 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Dark,
        MonsterType = monType.Amorph, MonsterFamily = monFamily.Slime,
        MpCost = 20, CastTime = 4000, RecastTime = 90000,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 596, Name = "Pinecone Bomb", Cost = 2,
        Desc = "Additional effect: sleep. Duration of effect varies with TP.",
        Notes = "Dark-based sleep",
        Stats = { Str = 1 },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Ranged, Element = element.None,
        MonsterType = monType.Plantoid, MonsterFamily = monFamily.Treant,
        MpCost = 48, CastTime = 2500, RecastTime = 26000,
        Target = target.Enemy, Range = 20, Area = 0,
        Resonances = { res.Liquefaction },
        Attributes = { Str = 0.2, Agi = 0.2 },
    },
    {
        Id = 592, Name = "Blank Gaze", Cost = 2,
        Desc = "Removes one beneficial magic effect from an enemy.",
        Notes = "Enemy must be facing you",
        Stats = { },
        Trait = traits.None, TraitPoints = 0,
        DamageType = damage.Magic, Element = element.Light,
        MonsterType = monType.Beast, MonsterFamily = monFamily.OpoOpo,
        MpCost = 25, CastTime = 3000, RecastTime = 10000,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { },
        Attributes = { },
    },
    {
        Id = 569, Name = "Jet Stream", Cost = 4,
        Desc = "Delivers a threefold attack. Accuracy varies with TP.",
        Stats = { Dex = 2 },
        Trait = traits.RapidShot, TraitPoints = 4,
        DamageType = damage.Blunt, Element = element.None,
        MonsterType = monType.Bird, MonsterFamily = monFamily.FlockBat,
        MpCost = 47, CastTime = 500, RecastTime = 23000,
        Target = target.Enemy, Range = 12, Area = 0,
        Resonances = { res.Impaction },
        Attributes = { Agi = 0.3 },
    },
    {
        Id = 594, Name = "Uppercut", Cost = 3,
        Desc = "Damage varies with TP.",
        Notes = "??% attack bonus",
        Stats = { Str = 2, Dex = 1 },
        Trait = traits.AttackBonus, TraitPoints = 4,
        DamageType = damage.Blunt, Element = element.None,
        MonsterType = monType.Plantoid, MonsterFamily = monFamily.Goobbue,
        MpCost = 31, CastTime = 500, RecastTime = 17000,
        Target = target.Enemy, Range = 3, Area = 0,
        Resonances = { res.Liquefaction, res.Impaction },
        Attributes = { Str = 0.35 },
    },
    {
        Id = 534, Name = "Mysterious Light", Cost = 4,
        Desc = "Deals wind damage to enemies within range. Additional effect: Weight.",
        Stats = { Agi = 3 },
        Trait = traits.MaxMpBoost, TraitPoints = 4,
        DamageType = damage.Magic, Element = element.Wind,
        MonsterType = monType.Arcana, MonsterFamily = monFamily.MagicPot,
        MpCost = 73, CastTime = 3750, RecastTime = 24500,
        Target = target.Enemy, Range = 5, Area = 5,
        Resonances = { },
        Attributes = { Chr = 0.3 },
    },
    {
        Id = 539, Name = "Terror Touch", Cost = 3,
        Desc = "Additional effect: Weakens attacks. Accuracy varies with TP.",
        Notes = "Attack -15%",
        Stats = { Hp = -5, Mp = 10 },
        Trait = traits.DefenseBonus, TraitPoints = 4,
        DamageType = damage.HandToHand, Element = element.None,
        MonsterType = monType.Undead, MonsterFamily = monFamily.Ghost,
        MpCost = 62, CastTime = 3250, RecastTime = 21000,
        Target = target.Enemy, Range = 5, Area = 0,
        Resonances = { res.Compression, res.Reverberation },
        Attributes = { Dex = 0.2, Int = 0.2 },
    },
}

return spells
