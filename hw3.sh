#!/bin/bash

touch p1.c

echo '
      
      #include <stdio.h>

      int main()
      {
       FILE *fp;
       char name[] = "script2.sh";
       if ((fp = fopen(name, "w")) == NULL)
       {
         printf("Can not open this file");
         getchar();
         return 0;
       }
       
       fprintf(fp, "#!/bin/bash \n touch p2.c \n echo \"#include <stdio.h>  \n int main(){ \n printf(\\\"Hello World\\\"); \n } \" > p2.c \n gcc p2.c \n ./a.out \n rm ./a.out \n rm ./p2.c ");
       
       popen("bash script2.sh", "w");
       return 0; 
      }
     ' > p1.c;

gcc -o p1 ./p1.c
./p1

rm ./p1
rm ./p1.c
rm ./script2.sh




