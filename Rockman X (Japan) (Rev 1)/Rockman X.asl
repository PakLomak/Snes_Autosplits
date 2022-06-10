state ("Mesen-S") //RAM 0x00 == "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0;
{
    byte start:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x39;
    byte menu:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x02;
    byte level:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x1F7A;
    byte end1:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0xD3;
    byte end2:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0xD4;
    byte lvlSigma:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x1F7B;
    byte pes:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0E69;
    byte reset:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0F;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x03FAFA48, 0x00;
{
    byte start:"mednafen.exe", 0x03FAFA48, 0x39;
    byte menu:"mednafen.exe", 0x03FAFA48, 0x02;
    byte level:"mednafen.exe", 0x03FAFA48, 0x1F7A;
    byte end1:"mednafen.exe", 0x03FAFA48, 0xD3;
    byte end2:"mednafen.exe", 0x03FAFA48, 0xD4;
    byte lvlSigma:"mednafen.exe", 0x03FAFA48, 0x1F7B;
    byte pes:"mednafen.exe", 0x03FAFA48, 0x0E69;
    byte reset:"mednafen.exe", 0x03FAFA48, 0x0F;
}
state("snes9x-x64") //RAM 0x00 == "snes9x-x64.exe", 0x8D8BE8, 0x00;
{
    byte start:"snes9x-x64.exe", 0x8D8BE8, 0x39;
    byte menu:"snes9x-x64.exe", 0x8D8BE8, 0x02;
    byte level:"snes9x-x64.exe", 0x8D8BE8, 0x1F7A;
    byte end1:"snes9x-x64.exe", 0x8D8BE8, 0xD3;
    byte end2:"snes9x-x64.exe", 0x8D8BE8, 0xD4;
    byte lvlSigma:"snes9x-x64.exe", 0x8D8BE8, 0x1F7B;
    byte pes:"snes9x-x64.exe", 0x8D8BE8, 0x0E69;
    byte reset:"snes9x-x64.exe", 0x8D8BE8, 0x0F;
}
start
{
    return(old.start == 0x02 && current.start == 0x04 && current.menu == 0xA6);
}
split
{
    if (current.end1 == 0x0A && old.end2 == 0x02 && current.end2 == 0x04) return true;
    if (current.level == 0x0C && current.lvlSigma == 0x03 && old.pes == 0x10 && current.pes == 0x12) return true;
}
reset
{
    return (current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Rockman X by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}