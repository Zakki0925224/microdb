#include <stdio.h>
#include <string.h>

#include "microdb.h"

#define BUF_LEN 512

static char BUF[BUF_LEN] = {0};

void input_loop()
{
    size_t s_len;

    while (1)
    {
        printf("microdb >");
        if (fgets(BUF, sizeof(char) * BUF_LEN, stdin) == NULL)
        {
            perror("fgets failed");
            return;
        }

        // remove \n
        s_len = strlen(BUF);
        if (s_len > 0 && BUF[s_len - 1] == '\n')
        {
            BUF[s_len - 1] = '\0';
        }

        if (strcmp(BUF, ".exit") == 0)
        {
            return;
        }
        else
        {
            printf("Unrecognized command \"%s\".\n", BUF);
        }
    }
}
