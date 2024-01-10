# Hello!

We are a collective working to make a text alert system for Air Quality "Spikes" in Minneapolis.

## Background 

When Canadian wildfires blanketed US cities in the summer of 2023, air quality rose to the forefront of public concern across the country. In Minneapolis, the fight for the East Phillips Urban Farm also raised air quality as an environmental justice issue in the public consciousness. Asthma and other health issues are clearly higher in Minneapolis neighborhoods which were [redlined](https://legacy.yourwebedition.com/stories/a-city-divided-0) and have more polluting facilities, particularly in North Minneapolis, a majority black neighborhood, and the Phillips and Cedar-Riverside neighborhoods in south Minneapolis, which have high Indigenous and immigrant populations. 

Federal regulations that monitor air quality at a regional level leave large gaps in data in terms of knowing what people in a particular block or neighborhood are exposed to. [Community-Based Air Quality Monitoring](https://www.georgetownclimate.org/articles/community-based-air-quality-monitoring-equitable-climate-policy.htm) (CBAQM) projects address those gaps by monitoring air quality at a neighborhood level.

Community organizers concerned about air quality have also come up with a variety of ways of tracking data and using it to hold governments and industry accountable for the poison put into our air. In Pittsburgh, for example, [Smell PHG](https://smellpgh.org) crowdsources information about smells to track pollutants that pose health risks to residents. **This is a crucial intervention because it treats people’s lived experiences as valid data.** 

[The City of Minneapolis](https://www.minneapolismn.gov/government/programs-initiatives/environmental-programs/air-quality/) has engaged in CBAM by putting up and maintaining [PurpleAir](https://map.purpleair.com/1/mAQI/a10/p604800/cC0#11/44.9368/-93.2834) monitors, a system which provides real-time readings of PM 2.5 readings. This is a very important investment. However, there is a gap between simply making data available to the public and making an active effort to deliver it to people who need it. The Air Quality Alerts system sets out to close the gap, by providing an easy way to get updates about bad air quality only when there is a significant spike. 

Air quality monitoring initiatives usually emphasize long-term exposure. However, acute exposure at certain levels also presents significant health risks. Future iterations of this project could offer daily, weekly or monthly air quality reports, but this version chooses to focus on 'spikes', which represent possible acute (short-term) exposure events.

We believe clean air is a human right. We believe communities deserve to know exactly what we are breathing in, when, and what effects it might have on our health. This alert system is intended to be a tool to facilitate awareness and capacity to fight against those that would treat marginalized  communities as sacrifice zones. 

## Functionality  

Users who want to receive spike alerts can fill out our survey and have their phone number and location of interest stored in a secure [REDCap](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5764586/) database hosted by the University of Minnesota. It’s likely most users will enter their home, although schools, work, a favorite park, or any other location would make sense. If anyone wants multiple locations, please fill out the survey twice (but please .

The program queries the PurpleAir API and searches for spikes above a threshold ([35 micrograms/meter^3](https://www.epa.gov/pm-pollution/national-ambient-air-quality-standards-naaqs-pm) is the current EPA Standard for PM2.5). The value is a variable that can easily be changed/adjusted. When the system detects a spike, it sends a text to all subscribers within a certain distance of the monitor if they don't already have an active alert. The text links to the sensor on the PurpleAir Webmap.

When all alerts end for a user, an end of spike alert message is sent to the subscriber, detailing the length and severity of the event, and a unique reporting option through REDCap. Sensor information is also archived for future reference (this does not include the user's location/phone number).

## Authors 

Priya Dalal-Whelan

Rob Hendrickson

### Contributors:

Mateo Frumholtz - Designing, building, and maintaining the REDCap Surveys

Jake Ford - Brainstorming

Connor - Organizing/Facilitating Zoom meetings

Doug - SMS Messaging development

Dan - Cloud development

We also acknowledge the preliminary work of the [Quality Air, Quality Cities team](https://github.com/RTGS-Lab/QualityAirQualityCities).
