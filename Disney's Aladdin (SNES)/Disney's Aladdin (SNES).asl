state ("Mesen-S") //RAM 0x00 == "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0;
{
    byte action:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x9F;
    byte demo:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x345;
    byte level:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x35E;
    byte screen:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x35D;
    byte reset:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x8D;
    byte cobra:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0xC0C;
    byte cobra2:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0xC5C;
}
state("mednafen", "1.27.1") //RAM 0x00 == "mednafen.exe", 0x03FAFA48, 0x00;
{
    byte action:"mednafen.exe", 0x03FAFA48, 0x9F;
    byte demo:"mednafen.exe", 0x03FAFA48, 0x345;
    byte level:"mednafen.exe", 0x03FAFA48, 0x35E;
    byte screen:"mednafen.exe", 0x03FAFA48, 0x35D;
    byte reset:"mednafen.exe", 0x03FAFA48, 0x8D;
    byte cobra:"mednafen.exe", 0x03FAFA48, 0xC0C;
    byte cobra2:"mednafen.exe", 0x03FAFA48, 0xC5C;
}
state("snes9x-x64") //RAM 0x00 == "snes9x-x64.exe", 0x8D8BE8, 0x00;
{
    byte action:"snes9x-x64.exe", 0x8D8BE8, 0x9F;
    byte demo:"snes9x-x64.exe", 0x8D8BE8, 0x345;
    byte level:"snes9x-x64.exe", 0x8D8BE8, 0x35E;
    byte screen:"snes9x-x64.exe", 0x8D8BE8, 0x35D;
    byte reset:"snes9x-x64.exe", 0x8D8BE8, 0x8D;
    byte cobra:"mednafen.exe", 0x03FAFA48, 0xC0C;
    byte cobra2:"snes9x-x64.exe", 0x8D8BE8, 0xC5C;
}
start
{
   return (current.level == 0x00 && current.demo == 0x00 && current.reset == 0x02 && old.action != 0x01 && current.action == 0x01);
}
split
{
    if (current.level == old.level + 1) return true;
    if (old.level != 0x24 && current.level == 0x24) return true;
    if (current.level == 0x11)
    {
        if (old.cobra == 0x00 && current.cobra == 0xFF) return true;
        if (old.cobra2 == 0x00 && current.cobra2 == 0xFF) return true; 
    }
}
reset
{
    return (current.action == 0x01 && current.reset == 0x01 && current.level == 0x00);
}
startup
{
	settings.Add("main", false, "It is necessary to set a start at 2.50!");
    settings.Add("main1", false, "AutoSplitter for Disney's Aladdin (SNES) by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main1");
}