state ("Mesen-S") //RAM 0x00 == "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0;
{
    byte start:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x305;
    byte start2:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0xBB0;
    byte lvl:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x340;
    byte virus:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x3CE;
    byte reset:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x01;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x03FAFA48, 0x00;
{
    byte start:"mednafen.exe", 0x03FAFA48, 0x305;
    byte start2:"mednafen.exe", 0x03FAFA48, 0xBB0;
    byte lvl:"mednafen.exe", 0x03FAFA48, 0x340;
    byte virus:"mednafen.exe", 0x03FAFA48, 0x3CE;
    byte reset:"mednafen.exe", 0x03FAFA48, 0x01;
}
state("snes9x-x64") //RAM 0x00 == "snes9x-x64.exe", 0x8D8BE8, 0x00;
{
    byte start:"snes9x-x64.exe", 0x8D8BE8, 0x305;
    byte start2:"snes9x-x64.exe", 0x8D8BE8, 0xBB0;
    byte lvl:"snes9x-x64.exe", 0x8D8BE8, 0x340;
    byte virus:"snes9x-x64.exe", 0x8D8BE8, 0x3CE;
    byte reset:"snes9x-x64.exe", 0x8D8BE8, 0x01;
}
start
{
    return (current.start == 0x04 && current.lvl == 0x00 && current.start2 == 0x06);
}
split
{
    if (current.lvl == old.lvl + 1) return true;
    if (settings["0-20"] && current.lvl == 0x14 && old.virus != 0x00 && current.virus == 0x00) return true;
    if (settings["0-10"] && current.lvl == 0x0A && old.virus != 0x00 && current.virus == 0x00) return true;
}
reset
{
    return (current.reset == 0x80 && current.start == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Dr.Mario SNES by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("0-20", true, "Split on 20 level", "options");
    settings.Add("0-10", false, "Split on 10 level", "options");
}
