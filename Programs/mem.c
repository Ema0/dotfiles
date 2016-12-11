#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/sysinfo.h>
void main()
{
FILE *fp;
char output[100];
char s[5];
char end[20];
int sysinfo(struct sysinfo *info);
/*bc -l <<< ((4050764/1024 - $(cat /proc/meminfo | grep -m 1 MemAvai | awk '{print $2}')/1024))
*/
fp = popen("/bin/free -h", "r");
fgets(output, sizeof(output)-1, fp);
fgets(output, sizeof(output)-1, fp);
strcpy(end, "%{F#84a9c0}%{F-} ");
strncpy ( s, output+27, 4);
strcat(end, s);
printf("%s", end);
pclose(fp);

}
