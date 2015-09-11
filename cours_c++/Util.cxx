#include "Util.hxx"
#include <string.h>

char * RecopieChaine(const char *uneChaine)
{
  char *temp=0;
  
  if (uneChaine)
  {
    temp=new char [strlen(uneChaine)+1];
    strcpy(temp, uneChaine);
  }
  return temp;
}


