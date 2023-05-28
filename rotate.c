#include <math.h>
#include <stdlib.h>


void rotate(
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

