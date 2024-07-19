#include <stdio.h>
#include <wchar.h>
#include <locale.h>

#include "ParaMor.h"

int main() {
    setlocale(LC_ALL, "");
    //unsigned char line[PARAMOR_FRAME_WIDTH + 1];
    //line[PARAMOR_FRAME_WIDTH] = '\0';
    wchar_t block = L'\u2588';
    for (int i = 0; i < PARAMOR_FRAME_HEIGHT; i++) {
        for (int j = 0; j < PARAMOR_FRAME_WIDTH; j++) {
            int k = (PARAMOR_FRAME_WIDTH*i) + j;
            wprintf(L"%lc", paramor_data[k] ? block : (wchar_t)' ');
        }
        wprintf(L"\n");
    }
    return 0;
}
