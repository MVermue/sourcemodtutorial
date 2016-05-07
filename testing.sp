#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

int number = 0;
float decimal = 0.0;
bool required = false;
Handle plugin = null;
char[] letter = new char[20];
int[] numbers =  { 5, 20, 14 };

// What do we need
// People need a command to become warden
// People need a command to resign from warden
// Admins need a command to remove the warden
// Admins can set a warden

public void OnPluginStart()
{
	
}