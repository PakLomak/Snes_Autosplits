state ("Mesen-S") //RAM 0x00 == "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x0;
{
    byte mode: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x278;
    byte stage: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x28D;
    byte control: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x2AC;
    byte half: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x28F;
    byte continues: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x290;
    byte loop: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x291;
    byte lastSplit: "MesenSCore.dll", 0x04264020, 0x48, 0xFE8, 0x48, 0x276;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x03FAFA48, 0x0;
{
    byte mode: "mednafen.exe", 0x03FAFA48, 0x278;
    byte stage: "mednafen.exe", 0x03FAFA48, 0x28D;
    byte control: "mednafen.exe", 0x03FAFA48, 0x2AC;
    byte half: "mednafen.exe", 0x03FAFA48, 0x28F;
    byte continues: "mednafen.exe", 0x03FAFA48, 0x290;
    byte loop: "mednafen.exe", 0x03FAFA48, 0x291;
    byte lastSplit: "mednafen.exe", 0x03FAFA48, 0x276;
}
state("ralibretro") //0x001ABE00, 0x0;
{
    byte mode : "RALibretro.exe", 0x001ABE00, 0x278; 
    byte stage : "RALibretro.exe", 0x001ABE00, 0x28D; 
    byte control : "RALibretro.exe", 0x001ABE00, 0x2AC; 
    byte half : "RALibretro.exe", 0x001ABE00, 0x28F;
    byte continues : "RALibretro.exe", 0x001ABE00, 0x290;
    byte loop : "RALibretro.exe", 0x001ABE00, 0x291;
    byte lastSplit : "RALibretro.exe", 0x001ABE00, 0x276;
}

init
{
    vars.menu = false;
}
start
{
    if (current.mode == 0) vars.menu = true;
    if (current.stage == 0x00 && current.control == 0x01 && current.half == 0x00 && vars.menu && current.continues != 0x00)
    {
        vars.menu = false;
        return true;
    }
}
split
{
    if (current.stage == 0x09)
    {
        if (old.lastSplit != 0x01 && current.lastSplit == 0x01) return true;
    }
    if (old.stage == 0x00 && current.stage == 0x01) return true;
    if (old.stage == 0x01 && current.stage == 0x02) return true;
    if (old.stage == 0x02 && current.stage == 0x03) return true;
    if (old.stage == 0x05 && current.stage == 0x06) return true;
    if (old.stage == 0x06 && current.stage == 0x07) return true;
    if (old.stage == 0x07 && current.stage == 0x08) return true;
    if (old.stage == 0x08 && current.stage == 0x09) return true;
    else if (current.stage == 0x08 && old.lastSplit == 0x00 && current.lastSplit == 0x04 && current.loop == 0x00) return true;
}
reset
{
    return (current.continues == 0x00 && current.mode == 0);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Super Ghouls 'n Ghosts by Xanders08 & PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("main4", false, "--https://www.twitch.tv/xanders08", "main");

}
update
{
    //print(current.link1.ToString("X2"));
}