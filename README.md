# NearestTimeZone

A fork of NearestTimeZone [https://github.com/buytruckload/nearest_time_zone] using Geokdtree[https://github.com/colinsurprenant/geokdtree] instead of Kdtree [https://github.com/gurgeous/kdtree], allowing for use with JRuby. Tested with MRI 2.1 and JRuby 1.7.

Currently, everything works except marshalling the Kdtree. This is only required to improve load time.
