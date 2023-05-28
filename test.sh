#!/bin/bash
./build/appC jpgs/$1.jpg jpgs/rotated.jpg $2;
./build/appCO jpgs/$1.jpg jpgs/rotated.jpg $2;
./build/appCO2 jpgs/$1.jpg jpgs/rotated.jpg $2;
./build/appCO3 jpgs/$1.jpg jpgs/rotated.jpg $2;
./build/appCO4 jpgs/$1.jpg jpgs/rotated.jpg $2;
./build/appCOfast jpgs/$1.jpg jpgs/rotated.jpg $2;
./build/appNASM jpgs/$1.jpg jpgs/rotated.jpg $2;


