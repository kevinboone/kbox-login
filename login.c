// Stupid wrapper for the real login script, because Android Linux will not
//  execvp() a script (so things like utelnetd fail)
#include <stdio.h>
#include <unistd.h>

int main (int argc, char **arv)
  {
  execlp ("/bin/sh", "/bin/sh", "-c", PREFIX "/bin/kbox-login", NULL);
  return -1;
  }

