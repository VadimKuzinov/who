#define _CRT_SECURE_NO_WARNINGS
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb/stb_image.h"
#include "stb/stb_image_write.h"
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


            if (ix < 0 || ix >= width || iy < 0 || iy >= height) {
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


int main(int argc, char **argv)
{
    if (argc < 4) {
        printf("Please, specify all the parameters: src, dst, angle\n");
        return 1;
    }

    int width, height, channels, new_width, new_height;
    unsigned char* image = stbi_load(argv[1], &width, &height, &channels, 0);
    if (image == NULL) {
        printf("Cannot load specified file\n");
        return 1;
    }

    double radians = atoi(argv[3]) * M_PI / 180;

    unsigned char* rotated_image = (unsigned char*)malloc(3LL * height * width * channels);
    if (rotated_image == NULL) {
        printf("Failed to allocate memory for rotated image\n");
        stbi_image_free(image);
        return 1;
    }

    rotate(width, height, channels, image, radians, &new_width, &new_height, rotated_image);
    stbi_image_free(image);

    int saved_status = stbi_write_jpg(argv[2], new_width, new_height, channels, rotated_image, 0);
    free(rotated_image);

    if (saved_status != 0) {
        printf("Failed to save rotated image into specified file\n");
        return 1;
    }

    stbi_image_free(image);
    free(rotated_image);

    return 0;
}

