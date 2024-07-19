#include <stdio.h>
#include <wchar.h>
#include <locale.h>

#include "Bitmap.h"

int main() {
    //unsigned char line[PARAMOR_FRAME_WIDTH + 1];
    //line[PARAMOR_FRAME_WIDTH] = '\0';
    setlocale(LC_ALL, "en_US.UTF-8");
    wchar_t block = L'\u2588';
    for (int i = 0; i < BITMAP_FRAME_HEIGHT; i++) {
        for (int j = 0; j < BITMAP_FRAME_WIDTH; j++) {
            int k = (BITMAP_FRAME_WIDTH*i) + j;
            wprintf(L"%lc", bitmap_data[k] ? block : (wchar_t)' ');
        }
        wprintf(L"\n");
    }
    return 0;
}
