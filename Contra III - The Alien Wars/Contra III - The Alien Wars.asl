state ("Mesen-S") //RAM 0x00 == "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0;
{
    byte scene:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x32;
    byte move:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x016B4;
    byte level:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x86;
    byte start:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x216;
    byte difficulty:"MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x1E3E;
}
state("mednafen", "1.27.1") //RAM 0x00 == "mednafen.exe", 0x03FAFA48, 0x00;
{
    byte scene:"mednafen.exe", 0x03FAFA48, 0x32;
    byte move:"mednafen.exe", 0x03FAFA48, 0x016B4;
    byte level:"mednafen.exe", 0x03FAFA48, 0x86;
    byte start:"mednafen.exe", 0x03FAFA48, 0x216;
    byte difficulty:"mednafen.exe", 0x03FAFA48, 0x1E3E;
}
state("snes9x-x64") //RAM 0x00 == "snes9x-x64.exe", 0x8D8BE8, 0x00;
{
    byte scene:"snes9x-x64.exe", 0x8D8BE8, 0x32;
    byte move:"snes9x-x64.exe", 0x8D8BE8, 0x016B4;
    byte level:"snes9x-x64.exe", 0x8D8BE8, 0x86;
    byte start:"snes9x-x64.exe", 0x8D8BE8, 0x216;
    byte difficulty:"snes9x-x64.exe", 0x8D8BE8, 0x1E3E;
}
init
{
    vars.hard = 0;
}
start
{
    if (current.scene == 0x09 && current.level == 0x01 && old.start == 0x00 && current.start == 0x03)
    {
        vars.hard = 0;
        return true;
    }
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x06 && old.move == 0x00 && current.move == 0x01 && current.difficulty <= 0x02) return true;
    if (current.level == 0x06 && old.move == 0x00 && current.move == 0x01 && current.difficulty == 0x04)
    {
        if (vars.hard >= 1) return true;
	    vars.hard = vars.hard + 1;
    }
}
reset
{
    return(current.scene == 0x00 && current.level == 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Contra III - The Alien Wars by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}