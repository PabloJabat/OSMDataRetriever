# OSMDataRetriever

## 1. Installation

First, clone this repository to one of your directories go inside it and run the following command: 

`mkdir Output`

Afterwards, you'll need to download SAXON and install it inside the directory where you have cloned this project. You can get SAXON from this link https://sourceforge.net/projects/saxon/files/

## 2. Usage

This project includes 2 scripts for retrieving data from Open Street Map. One gets the data in .nt format and the other one in .csv. The data that it takes from OSM is the id of the ways, the coordinates of the way and a boolean variable that says if it is a two-way road or not.

Insert the following command in the shell

`./getMapDataRDF outputFileName maxLat minLat maxLon minLon`

You can also retrieve the data in .csv format using the other script provided in exactly the same way

`./getMapDataCSV outputFileName maxLat minLat maxLon minLon`

Your file will be placed in Output folder. Remeber that the maximun degree diference must be below 0.5

