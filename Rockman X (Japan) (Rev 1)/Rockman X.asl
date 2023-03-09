state("Mesen-S", "0.4.4")
{
byte start: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x39;
byte menu: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x2;
byte level: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x1F7A;
byte end1: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0xD3;
byte end2: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0xD4;
byte lvlSigma: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x1F7B;
byte pes: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0xE69;
byte reset: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x0;
byte shine: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0xBBF;
byte damag: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0xC32;
byte bossroom: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x1D38;
byte sub_lvl: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0xE72;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x4109808, 0x39;
byte menu: "mednafen.exe", 0x4109808, 0x2;
byte level: "mednafen.exe", 0x4109808, 0x1F7A;
byte end1: "mednafen.exe", 0x4109808, 0xD3;
byte end2: "mednafen.exe", 0x4109808, 0xD4;
byte lvlSigma: "mednafen.exe", 0x4109808, 0x1F7B;
byte pes: "mednafen.exe", 0x4109808, 0xE69;
byte reset: "mednafen.exe", 0x4109808, 0x0;
byte shine: "mednafen.exe", 0x4109808, 0xBBF;
byte damag: "mednafen.exe", 0x4109808, 0xC32;
byte bossroom: "mednafen.exe", 0x4109808, 0x1D38;
}
state("Snes9x", "1.60 x64")
{
byte start: "snes9x-x64.exe", 0x8D8BE8, 0x39;
byte menu: "snes9x-x64.exe", 0x8D8BE8, 0x2;
byte level: "snes9x-x64.exe", 0x8D8BE8, 0x1F7A;
byte end1: "snes9x-x64.exe", 0x8D8BE8, 0xD3;
byte end2: "snes9x-x64.exe", 0x8D8BE8, 0xD4;
byte lvlSigma: "snes9x-x64.exe", 0x8D8BE8, 0x1F7B;
byte pes: "snes9x-x64.exe", 0x8D8BE8, 0xE69;
byte reset: "snes9x-x64.exe", 0x8D8BE8, 0x0;
byte shine: "snes9x-x64.exe", 0x8D8BE8, 0xBBF;
byte damag: "snes9x-x64.exe", 0x8D8BE8, 0xC32;
byte bossroom: "snes9x-x64.exe", 0x8D8BE8, 0x1D38;
}
init
{
    vars.lvlone = true;
}
start
{
    if (old.start == 0x02 && current.start == 0x04 && current.menu == 0xA6) {vars.lvlone = true;
    return true;}
}
split
{
    if (settings["black"] && current.end1 == 0x0A && old.end2 == 0x02 && current.end2 == 0x04) return true;
    if (settings["speed"] && current.level == 0x00 && old.damag == 0x2E && current.damag == 0x30 && vars.lvlone == true)    {vars.lvlone = false;
    return true;}
        if (settings["speed"] && current.sub_lvl == 0x02 || current.sub_lvl == 0x05 || current.sub_lvl == 0x07 || current.sub_lvl == 0x0A || current.sub_lvl == 0x0C || current.sub_lvl == 0x14 || current.sub_lvl == 0x31 || current.sub_lvl == 0x52 || current.sub_lvl == 0x5D || current.sub_lvl == 0x62 || current.sub_lvl == 0x63)
        {
            if (current.shine == 0x50 && old.shine != 0x50) return true;
        }
    if (current.level == 0x0C && current.lvlSigma == 0x03 && old.pes == 0x10 && current.pes == 0x12) return true;
}
reset
{
    return (current.reset == 0x61 && current.end1 == 0x00 && current.level == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Rockman X by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("black", true, "Split by Level end", "options");
	settings.Add("speed", false, "Split by speedruners", "options");
}