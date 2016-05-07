#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

int g_iWarden = -1;

// What do we need
// People need a command to become warden
// People need a command to resign from warden
// Admins need a command to remove the warden
// Admins can set a warden

public void OnPluginStart()
{
	RegConsoleCmd("sm_warden", Command_Warden);
	RegConsoleCmd("sm_w", Command_Warden);
	RegConsoleCmd("sm_uw", Command_Unwarden);
	RegAdminCmd("sm_rw", Command_RemoveWarden);
	RegAdminCmd("sm_sw", Command_SetWarden);
}

public Action Command_Warden(int client, int args)
{
	if (g_iWarden != -1)
	{
		g_iWarden = client;
	}
	
	return Plugin_Handled;
}

public Action Command_Unwarden(int client, int args)
{
	if (g_iWarden == client)
	{
		g_iWarden = -1;
	}
	
	return Plugin_Handled;
}

public Action Command_RemoveWarden(int client, int args)
{
	g_iWarden = -1;
	
	return Plugin_Handled;
}

public Action Command_SetWarden(int client, int args)
{
	if (args < 1)
	{
		ReplyToCommand(client, "Syntax: sm_sw <name | #userid>");
		return Plugin_Handled;
	}
	
	char name[MAX_NAME_LENGTH];
	GetCmdArg(1, name, sizeof(name));
	
	int target = FindTarget(client, name, true, true);
	
	if (target == -1)
	{
		// We have no target
		ReplyToCommand(client, "This target does not exist!");
		return Plugin_Handled;
	}
	
	g_iWarden = target;
	ReplyToCommand(client, "We have set the warden you wanted: %d is now warden!", target);
}