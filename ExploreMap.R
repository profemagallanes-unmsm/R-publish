

# read the spatial data ---------------------------------------------------

library(ggplot2)
library(sf)
fileMapPoints="https://github.com/profemagallanes-unmsm/FGV_Python_prepublish/raw/main/DataFiles/calls911_geo.geojson"
fileMapPolygons="https://github.com/profemagallanes-unmsm/FGV_Python_prepublish/raw/main/DataFiles/MapSeattle.geojson"
events=read_sf(fileMapPoints)
city=read_sf(fileMapPolygons)

# plot the spatial data ---------------------------------------------------
base=ggplot(city) + geom_sf() + theme_light()
eventsByTime=base + geom_sf(data = events,
                            size=0.5,
                            aes(color=nightTime)) 
eventsByTime