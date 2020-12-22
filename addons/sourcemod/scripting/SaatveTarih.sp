#include <sourcemod>

ConVar Tag;
new String:Eklenti_Tagi[32];

public Plugin myinfo = {
	name = "Saat ve Tarih",
	author = "Darfk",
	description = "!saat yazınca saati !tarih yazınca tarihi gösterir.",
	version = "1.00",
	url = "https://github.com/Darfk-S/CSGO-SaatveTarih",
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_saat", CMD_Saat, "", 0);
	RegConsoleCmd("sm_tarih", CMD_Tarih, "", 0);
	Tag = CreateConVar("saat_tarih_tag", "SM", "Saat ve Tarih Eklentisinin tagını burdan değiştirebilirsiniz. ([ ] gibi işaretler koymayınız)");
	AutoExecConfig(true, "Saat_ve_Tarih", "sourcemod");
}

public Action CMD_Saat(int client, int args)
{
	GetConVarString(Tag, Eklenti_Tagi, 64);
	char Saat[32];
	FormatTime(Saat, sizeof(Saat), "%I-%M-%S", GetTime());
	PrintToChat(client, " \x04[\x02%s\x04] \x0eSaat: \x10%s", Eklenti_Tagi, Saat);
}

public Action CMD_Tarih(int client, int args)
{
	GetConVarString(Tag, Eklenti_Tagi, 64);
	char Tarih[32];
	FormatTime(Tarih, sizeof(Tarih), "%d/%m/20%y", GetTime());
	PrintToChat(client, " \x04[\x02%s\x04] \x0eTarih: \x10%s", Eklenti_Tagi, Tarih);
}