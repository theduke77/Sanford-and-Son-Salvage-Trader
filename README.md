

--------------
Create by: Theduke™ Payden and Spider from Elite SLK Gaming
--------------

Welcome to Sanford and Son Trader.

Sadly this trader does not accept gold, only coins

"Hero or not, we buy just about everything
you can bring us. Certainly at a discounted price.
We will pay you 75% of what the other guys
give you. But I can guarantee you’ll never
unload everything all at once if you visit them!"

The Idea was to create a trader where you could sell EVERYTHING...well, just about everything ;)

New players sometimes arn't able to sell hero items, or maybe you have a vehicle full of junk
you might not want anymore and why not make a bit of cash from it, right?

This trader will NOT be a install and go type of mod.
You will need to take YOUR server items from the trader files, and change the price at the discount you choose.
(you can leave your prices the same if you want, completely up to you)

This is because every server most likely has different prices on items.
Going through each file and changing each price manually just isnt feasible.
How to do this will be explained later in the post. (its not as scary as it sounds)

Many thanks to @Payden for creating the run.bat  file and doing the leg work for creating the sanfordandson.hpp file and instructions.

Many thanks to Spider for creating the trader buildings.

DOWNLOAD

Tools you will need.

Notepad++
PBO Manager
Excel
...Maybe a sandwich and a drink lol

 

FOR NOW WE WILL ONLY USE CHERNARUS - WE HAVE LINGOR WORKING ALSO

Lets start with the easy part, server sided

1. Open your dayz_server\traders\chernarus11.sqf

Anywhere in the middle, add this

//Sandford and son Salvage
    ["Gangsta_merc7", [9910.58,5432.17,0.00143433],106.201],

   
2. Still in the dayz_server folder, put the sanford.sqf from the download in the objects folder.  If you don't have the objects folder create one.

So the sanford.sqf should be in a folder path like this. dayz_server\objects\sanford.sqf

3. Open the init folder, then server_functions.sqf

Look for this
 

spawn_vehicles = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_vehicles.sqf";

Add this bellow
 

execVM "\z\addons\dayz_server\objects\sanford.sqf";

Thats it for the server sided

 

Now for the mission

1. Open your server_traders.sqf

At the top you will see a list of traders,
add this, but make sure if its your last entry, there shouldn't be a comma at the end

"Gangsta_merc7",

2. still in server_traders.sqf

Add this at the bottom
 

//Sanford and Son Trader
menu_Gangsta_merc7 = [
    [["Sanford And Son Salvage",666]],
    [],
    "neutral"
];

Save and close the file.

4. Put the sanford folder from the download in your custom folder in your mission. If you dont have a custom folder create one.

5. Open your description.ext

Look for

class CfgSounds
{

add this before the closing bracket

class sanford
	{
		name = "sanford";
		sound[] = {custom\sanford\sanford.ogg,1.0,1};
		titles[] = {};
	};

6.Open your mission.sqm

look for

class Sensors

add this block of code, before the class sensors closing bracket.
Pay attention to the class item6. They need to be in order and you will need to adjust the items6 to items 7 right bellow class sensors also.

class Item6
		{
			position[]={9910.58,0,5432.17}; 
			a=15;
			b=15;
			activationBy="WEST";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="zonesanford";
			expCond="(player distance zonesanford) < 25;";
			expActiv="sanford = [] execVM ""custom\sanford\music.sqf"";";
			expDesactiv="terminate sanford; titleText [""Thanks For visiting us! Come Again"", ""PLAIN DOWN"", 3];";
			class Effects
			{
			};
		};

 

Alright the easy part is done lol

Now is the time to configure your prices for the trader.

Optional/Disclaimer
  Hide contents

Ultimately, if you want***, you can use our trader items.
Every item has been checked to make sure there were no dupes,
and if there was, like same ammo at different traders for example,
we made sure prices were the same.
We also spent alot of time re configuring the prices to try and make it more balanced.
This choice is completely up to you as the server owner,
but be warned if you use our prices on a existing server,
it could cause chaos for the players.  They are available in the
download in the "ESLK trader items" folder.

Also know that they have been personalized for our servers.
We are PVE, do not have bandit trader,
and have custom stuff available at trader that isnt in the default files.

This part Payden will take over the instructions

I decided to make a video based on what Payden explained to me

Video can be found bellow
****************************

Building the Scrap Trader File:

1. Put all trader files (YOUR MISSION\dayz_code\configs\Category) in a single directory. Rename any Hero or Epic Hero files to resolve duplicate names

2. Put the run.bat file from the download in that folder also.
Run the bat file, it will compile all your files into one and should create a file called "output.txt"

Now the fun part begins.

3. In order to import into excel and properly change the prices. You need to change the format of the files.

Open output.txt with notepad++.
In notepad++, click on view>Show Symbol>Show All Characters

This will show all spaces, tabs, line breaks...everything.

when done, it should look like this
class    G36C_DZ    {type=“trade_weapons";buy[]={    60000    ,”worth”};sell[]={    20000    ,”worth”};};

and not this

class G36C_DZ    {
type=“trade_weapons";
buy[]={    60000,”worth”};
sell[]={20000,”worth”};
};

- All whitespace is TAB characters.  Tabs between "class" and classname, between classname and {type=..., before and after buy price, before and after sell price.

4. Import the plain text file into Excel. You should end up with everything separated by columns:



    1. class and ClassName (e.g., M4A1_HWS_GL_camo)
    2. All before the buy price (e.g., {type=“trade_any_vehicle";buy[]={)
    3. Buy price
    4. All between buy price and sell price (e.g., ,”worth”};sell[]={)
    5. Sell price
    6. All after sell price (e.g., ,”worth”};};)
    
    If you're like me, you'll need to repeat this process several times to get everything correct.  Filters will help you find the oddball entries in each row.
    
5. Use Excel's conditional formatting to highlight duplicate classnames.  Compare prices, pick the one you will use, delete the other entry

6. Set all buy prices to -1

7. Decide on your discount (our scrap trader pays 75% of standard trader prices) and calculate/replace the original sell prices using excel formulas

8. Use Excel's filters to either hide or delete rows containing only classnames or filenames.  Also remove extra "};" where needed to make these lines a single class

8. Use Excel to save/export the file to Formatted Text (Space delimited).  You'll need to widen the Excel columns to ensure nothing is truncated.

9. If you're like me, you'll need to repeat this step also to ensure your class is correct and no data fields were truncated.

10. Change the filename extension from PRN to HPP if you haven't already.

VIDEO:
https://www.youtube.com/watch?v=UQ7a9WeB88A&feature=youtu.be
**************************

11. Now you need to navigate to your trader files, and drop the sanfordandson.hpp you just created with the rest of your trader files.
The path should be dayz_code\configs\category

12. Open your cfgServerTrader.hpp. Located in dayz_code\configs

add this in the middle anywhere

#include "category\SanfordAndSon.hpp"

Thats it you're done.

Hope you enjoy Sanford and Son Salvage Trader
