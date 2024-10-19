//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"",  "battery",  1,  4},
  {"",	"clock",    1,  4},
  {"",	"memory",   1,  4},
  {"",	"internet", 1,	4},
  {"",	"volume",   1,  4}
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
