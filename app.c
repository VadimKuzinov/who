#define _CRT_SECURE_NO_WARNINGS
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb/stb_image.h"
#include "stb/stb_image_write.h"
#include <math.h>
#include <time.h>

extern void rotate(
        int width, int height, int channels, unsigned char* image, 
        double radians, 
        int* new_w, int* new_h, unsigned char* rotated_image);

struct timespec measure_rotate(
    int width, int height, int channels, unsigned char* image, 
    double radians, 
    int* new_w, int* new_h, unsigned char* rotated_image, 
    void (*rotate_func)(int, int, int, unsigned char*, double, int*, int*, unsigned char*),
    int reps
)
{
    struct timespec t, t1, t2;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t1);
    for (int i = 0; i < reps; i++) {
        (*rotate_func)(width, height, channels, image, radians, new_w, new_h, rotated_image);
    }
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t2);
    long long nanos = (t2.tv_sec - t1.tv_sec) * 1000000000LL + (t2.tv_nsec - t1.tv_nsec);
    nanos /= reps;

    t.tv_sec =  nanos / 1000000000LL;
    t.tv_nsec = nanos % 1000000000LL;

    return t;
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

    struct timespec t;
    t = measure_rotate(
        width, height, channels, image, 
        radians, 
        &new_width, &new_height, rotated_image,
        rotate,
        10);
    printf("%ld.%09ld\n", t.tv_sec, t.tv_nsec);

    stbi_image_free(image);

    int saved_status = stbi_write_jpg(argv[2], new_width, new_height, channels, rotated_image, 0);
    free(rotated_image);

    if (saved_status == 0) {
        printf("Failed to save rotated image into specified file\n");
        return 1;
    }

    return 0;
}

