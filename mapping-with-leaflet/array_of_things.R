# Clean working environment (remove all variables)
rm(list = ls())

# Load leaflet library. Install first if needed.
# install.packages('leaflet')
library(leaflet)

# R's leaflet package has really nice documentation
# The following example is inspired by some of their examples
# https://rstudio.github.io/leaflet/



# Load the Array of Things location data as a data.frame
# Data from:
# https://data.cityofchicago.org/Environment-Sustainable-Development/Array-of-Things-Locations-Map/2dng-xkng
aotDF <- read.csv('data/Array_of_Things_Locations_-_Map.csv')

# Some commands to inspect data
head(aotDF)     # Print first six rows
tail(aotDF)     # Print last six rows
str(aotDF)      # Structure
summary(aotDF)  # Summary statistics

# In this case, we have data that already has latitude and longitude
# If you only had addresses, you'd need to use what is called "geocoding"
# to get latitude and longitude coordinates.
# There are services that do this, e.g. Google has one that lets you
# geocode a limited number of locations per day. 



# Leaflet example begins here. 

# The main way to use leaflet is through this leaflet object,
# or what they call a "map widget"
# You initialize one with leaflet(), and can save it to a variable
# Printing it by just calling it in console will open it up in RStudio viewer
map <- leaflet()
map
# Running this should show you a blank map. 
# It's still a map though, you can zoom and click around

# The actual map graphics are called "tiles" and work like they sound
# You give the leaflet functions that add them your map widget, 
# and it will give it back to you with the new stuff added in
map <- addTiles(map)
map
map <- setView(map, lat = 41.8781, lng = -87.6298, zoom = 10)
map
# Now you should see a map centered on Chicago


# Having to keep reassigning your variable is kind of annoying
# So actually the main way people use R leaflet is to use pipes: %>%
# This is functionality from the magrittr package (leaflet automatically loads it)
# Basically it takes an object and pipes it through functions as the first argument

# We can also pass in our data frame in the initial leaflet call
# Then we can use the addMarkers command to point marker attributes
# to columns in our data frame
x <- (leaflet(data = aotDF)
      %>% addTiles()
      %>% setView(lat = 41.8781, lng = -87.6298, zoom = 10)
      %>% addMarkers(lng = ~Longitude, lat = ~Latitude, popup = ~Name)
)
x

# The funny ~ means a symbolic expression. You treat the column names as
# variables. It also means you can write expressions that transform the columns
# Lets say you had a different version of the data where the coordinates
# were in radians instead of degrees
aotDFradians <- aotDF
aotDFradians$Latitude <- aotDFradians$Latitude *  pi / 180
aotDFradians$Longitude <- aotDFradians$Longitude *  pi / 180
# Then you can do the math in that call to get back to degrees
x <- (leaflet(data = aotDFradians)
      %>% addTiles()
      %>% setView(lat = 41.8781, lng = -87.6298, zoom = 10)
      %>% addMarkers(lng = ~Longitude*180/pi, lat = ~Latitude*180/pi, popup = ~Name)
)
x

# Because your computer graphics processor has to figure out how to render every
# marker individually, leaflet can really kill your computer if you have too many.
# Ballpark, probably don't try more than several hundred points. 
# A way to work past this is to use marker clustering. 
# This groups together markers when you're at a further away zoom level
x <- (leaflet(data = aotDF)
      %>% addTiles()
      %>% setView(lat = 41.8781, lng = -87.6298, zoom = 10)
      %>% addMarkers(lng = ~Longitude, lat = ~Latitude, popup = ~Name, clusterOptions = markerClusterOptions())
)
x

# Asked about subsetting/filtering. 
# Probably easiest way is to filter before passing in data. 
x <- (leaflet(data = aotDF[aotDF$Status == 'Planned',])
      %>% addTiles()
      %>% setView(lat = 41.8781, lng = -87.6298, zoom = 10)
      %>% addMarkers(lng = ~Longitude, lat = ~Latitude, popup = ~Name)
)
x


# If you want to use different map tiles, there are several sets of other
# tiles from other sources that are directly compatible with leaflet. 
# You can use addProviderTiles() instead of addTiles() to use them
# In particular, the ones from the companies MapBox and CartoDB look nice. 
# See previews of them at:
# https://leaflet-extras.github.io/leaflet-providers/preview/
x <- (leaflet(data = aotDF)
      %>% addProviderTiles('Stamen.Watercolor')
      %>% setView(lat = 41.8781, lng = -87.6298, zoom = 10)
      %>% addMarkers(lng = ~Longitude, lat = ~Latitude, popup = ~Name)
)
x
# Though for data analysis, I would recommend using grayscale tiles 
# so you can better see color of your markers or of any filled shapes.
# CartoDB.Positron or mapbox.light


# The example loosely followed some of the examples in the R leaflet documentation
# https://rstudio.github.io/leaflet/map_widget.html
# https://rstudio.github.io/leaflet/markers.html


# Unfortunately, it's not that easy to modify the default blue markers
# You'd need to provide map icon graphics
# The markers tutorial from RStudio shows how you can do it, and also
# recommends this plug-in that has markers pre-made
# https://github.com/lvoogdt/Leaflet.awesome-markers
