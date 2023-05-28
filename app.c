#define _CRT_SECURE_NO_WARNINGS
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image.h"
#include "stb_image_write.h"
#include <math.h>

extern void rotate(
        int width, int height, int channels, unsigned char* image, 
        double radians, 
        int* new_w, int* new_h, unsigned char* rotated_image);

void rotate2(
        int width, int height, int channels, unsigned char* image, 
        double radians, 
        int* new_w, int* new_h, unsigned char* rotated_image)
{
    int new_width = abs(width * cos(radians)) + abs(height * sin(radians));
    int new_height = abs(width * sin(radians)) + abs(height * cos(radians));

    for (int y = 0; y < new_height; y++) {
        for (int x = 0; x < new_width; x++) {
            double new_x = cos(radians) * (x - new_width / 2) + sin(radians) * (y - new_height / 2) + width / 2;
            double new_y = -sin(radians) * (x - new_width / 2) + cos(radians) * (y - new_height / 2) + height / 2;
            int ix = (int)new_x;
            int iy = (int)new_y;

//            printf("%d %d new(old): %d %d %lf %lf\n", y, x, iy, ix, new_y, new_x);

            if (ix < 0 || ix >= width || iy < 0 || iy >= height) {
                // handle out-of-bounds pixels
            }
            else {
                unsigned char* pixel = image + (iy * width + ix) * channels;
                unsigned char* rotated_pixel = rotated_image + (y * new_width + x) * channels;
                for (int c = 0; c < channels; c++) {
                    rotated_pixel[c] = pixel[c];
                }
            }
        }
    }

    *new_w = new_width;
    *new_h = new_height;
}


int main()
{
    int width, height, channels;
    unsigned char* image = stbi_load("butterfly.jpg", &width, &height, &channels, 0);

    double radians = 3 * M_PI / 4; // 45 degrees in radians

    int new_width = abs(width * cos(radians)) + abs(height * sin(radians));
    int new_height = abs(width * sin(radians)) + abs(height * cos(radians));

    unsigned char* rotated_image = (unsigned char*)malloc(3LL * height * width * channels);
    if (rotated_image == NULL) {
        printf("Malloc failed\n");
        return 1;
    }

    rotate(width, height, channels, image, radians, &new_width, &new_height, rotated_image);
    printf("new_w = %d, new_h = %d\n", new_width, new_height);
    int size = new_width * new_height * channels;
    for (int i = 0; i < size; i++) {
       // printf("%d\n", i);
        unsigned char pxl = rotated_image[i];
       // printf("%d'th: ", i);
       // printf("%u\n", pxl);
    }

    stbi_write_jpg("rotated.jpg", new_width, new_height, channels, rotated_image, 0);

    stbi_image_free(image);
    free(rotated_image);

    return 0;
}
