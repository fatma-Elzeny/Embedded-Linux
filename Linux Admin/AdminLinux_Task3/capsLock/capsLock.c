#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main (int argc,char *argv[]){
int variable;
variable = open("/sys/class/leds/input9::capslock/brightness",O_RDWR);
printf("%d\n",argc);
if(argv[1] != NULL)
  dprintf(variable,"%s\n",argv[1]);

return 0;
}
