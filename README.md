# OSMTripleStoreConverter

## 1. Installation

First, clone this repository to one of your directories go inside it and run the following command: 

`mkdir Output`

Afterwards, you'll need to download SAXON and install it inside the directory where you have cloned this project. You can get SAXON from this link https://sourceforge.net/projects/saxon/files/

## 2. Usage

Insert the following command in the shell

`./getMapData outputFileName maxLat minLat maxLon minLon`

Your file will be placed in Output folder. Remeber that the maximun degree diference must be below 0.5
