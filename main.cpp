
#include <3ds.h>
#include <iostream>

int main()
{
    gfxInitDefault();
    consoleInit(GFX_TOP, NULL);

    printf("Hello 3DS!\nPress START to exit.");

    while (aptMainLoop())
    {
        std::cout << "Hello 3DS!" << std::endl << "|| hit start to quit" << std::endl;
        std::cout << "press a key (a_b_y_x) to see if input works" << std::endl;
        _sleep(3000);
        hidScanInput();
        u32 kDown = hidKeysDown();
        while (aptMainLoop())
        {
            if (kDown & KEY_A)
            {
                std::cout << "A works" << std::endl;
                break;
            } else if (kDown & KEY_B)
            {
                std::cout << "B works" << std::endl;
                break;
            } else if (kDown & KEY_X)
            {
                std::cout << "X works" << std::endl;
                break;
            } else if (kDown & KEY_Y)
            {
                std::cout << "Y works" << std::endl;
                break;
        }
            if (kDown & KEY_START) break;

            gfxFlushBuffers();
            gfxSwapBuffers();
            gspWaitForVBlank();
        

    }

    gfxExit();
    return 0;
}
}

