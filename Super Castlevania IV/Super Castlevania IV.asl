state("snes9x-x64")
{
    byte start:"snes9x-x64.exe", 0x8D8BE8, 0x070;
    byte orb:"snes9x-x64.exe", 0x8D8BE8, 0x13E8;
    byte hp_boss:"snes9x-x64.exe", 0x8D8BE8, 0x13F6;
    byte stage:"snes9x-x64.exe", 0x8D8BE8, 0x086;
    byte logo:"snes9x-x64.exe", 0x8D8BE8, 0x032;
    byte time:"snes9x-x64.exe", 0x8D8BE8, 0x076;
}
state("Mesen-S", "0.4.4")
{
byte start: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x70;
byte orb: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x13E8;
byte hp_boss: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x13F6;
byte stage: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x86;
byte logo: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x32;
byte time: "MesenSCore.dll", 0x4263DA8, 0x48, 0x5F0, 0x48, 0x76;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x03FAFA48, 0x00;
{
    byte start:"mednafen.exe", 0x03FAFA48, 0x070;
    byte orb:"mednafen.exe", 0x03FAFA48, 0x13E8;
    byte hp_boss:"mednafen.exe", 0x03FAFA48, 0x13F6;
    byte stage:"mednafen.exe", 0x03FAFA48, 0x086;
    byte logo:"mednafen.exe", 0x03FAFA48, 0x032;
    byte time:"mednafen.exe", 0x03FAFA48, 0x076;
}
start
{
    return (current.stage == 0x00 && current.start == 0x05);
}
split
{
    if (settings["Rowdain"] && current.stage == 0x07 && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //Rowdain
    if (settings["Medusa"] && old.stage == 0x09 && current.stage == 0x0A) return(true); //Medusa
    if (settings["2_Stage"] && old.stage == 0x0B && current.stage == 0x0C) return(true); //2 Stage
    if (settings["Orphic_Vipers"] && current.stage == 0x11 && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //Orphic Vipers
    if (settings["Puweyxil"] && old.stage == 0x14 && current.stage == 0x15) return(true); //Puweyxil
    if (settings["Koranot"] && current.stage == 0x17 && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //Koranot
    if (settings["5_Castle"] && old.stage == 0x19 && current.stage == 0x1A) return(true); //5 Castle
    if (settings["The_Dancing_Spectres"] && current.stage == 0x22 && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //The Dancing Spectres
    if (settings["Sir_Grakul"] && current.stage == 0x29 && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //Sir Grakul
    if (settings["The_Monster"] && current.stage == 0x2D && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //The Monster
    if (settings["Zapf_Bat"] && current.stage == 0x35 && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //Zapf Bat
    if (settings["Akmodan_II"] && current.stage == 0x3B && old.orb == 0x00 && current.orb == 0x01 && current.hp_boss == 0x00) return(true); //Akmodan II
    if (settings["B_Stage"] && old.stage == 0x3E && current.stage == 0x3F) return(true); //B Stage
    if (settings["Slogra"] && old.stage == 0x3F && current.stage == 0x40) return(true); //Slogra
    if (settings["Gaibon"] && old.stage == 0x40 && current.stage == 0x41) return(true); //Gaibon
    if (settings["The_Grim_Reaper"] && old.stage == 0x41 && current.stage == 0x42) return(true); //The Grim Reaper
    if (settings["Dracula"] && current.stage == 0x43 && old.orb == 0x00 && current.orb == 0x01) return(true); //Dracula
}
reset
{
    return (current.logo == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Super Castlevania IV by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Split");
    settings.Add("Rowdain", true, "Rowdain", "options");
	settings.Add("Medusa", false, "Medusa", "options");
	settings.Add("2_Stage", true, "2 Stage", "options");
	settings.Add("Orphic_Vipers", true, "Orphic Vipers", "options");
	settings.Add("Puweyxil", false, "Puweyxil", "options");
	settings.Add("Koranot", true, "Koranot", "options");
	settings.Add("5_Castle", true, "5 Castle", "options");
	settings.Add("The_Dancing_Spectres", true, "The Dancing Spectres", "options");
	settings.Add("Sir_Grakul", true, "Sir Grakul", "options");
	settings.Add("The_Monster", true, "The Monster", "options");
	settings.Add("Zapf_Bat", true, "Zapf Bat", "options");
	settings.Add("Akmodan_II", true, "Akmodan II", "options");
	settings.Add("B_Stage", false, "B Stage", "options");
    settings.Add("Slogra", false, "Slogra", "options");
    settings.Add("Gaibon", false, "Gaibon", "options");
    settings.Add("The_Grim_Reaper", false, "The Grim Reaper", "options");
    settings.Add("Dracula", true, "Dracula", "options");
}
