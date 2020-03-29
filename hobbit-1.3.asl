state("meridian")
{
	bool onCutscene : 0x35CCE4;
	int cutsceneID : 0x35CD00; 
	bool loadScreen: 0x35F8C8;
	int oolState : 0x362B58;
	int levelID : 0x362B5C;
	bool menuClosed : 0x413040;
}
startup
{
	vars.level = -1;
	refreshRate = 30;
}
start
{
	if (current.levelID == -1 && current.menuClosed == true && current.oolState == 17)
	{
		vars.level = 0;
		return true;
	}
}
split
{
	if (current.oolState == 19 && (current.levelID - vars.level) > 0)
	{
		vars.level += 1;
		return true;
	}
	if (current.levelID == 11 && current.onCutscene == true && current.cutsceneID == 0x3853B400)
	{
		vars.level = -1;   
		return true;
	}
}
reset
{
	if (current.levelID == -1 && current.menuClosed == false && vars.level != -1)
	{
		vars.level = -1;
		return true;
	}
}
isLoading
{
	return current.loadScreen;
}
