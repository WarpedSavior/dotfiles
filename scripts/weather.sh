#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
CITY_ID="EUR|ES|VC086|ALFARADELPATRIARCA"
SYMBOL_CELSIUS="°C"

WEATHER_URL="http://rss.accuweather.com/rss/liveweather_rss.asp?metric=${METRIC}&locCode=${CITY_ID}"

WEATHER_INFO=$(wget -qO- "${WEATHER_URL}" -o /dev/null)
WEATHER_MAIN=$(echo "${WEATHER_INFO}" | grep "Currently: " | awk -F ':' '{print $2}' | tr -d '"')
WEATHER_TEMP=$(echo "${WEATHER_INFO}" | grep "Currently: " | awk -F ':' '{print $3}' | cut -d 'C' -f 1 | tr -d '"')

# get your location
#WEATHER_LOCATION=$(echo "${WEATHER_INFO}" | grep "AccuWeather.com Forecast<" | head -1 | awk -F '>' '{print $2}' | cut -d ',' -f 1)

case $1 in
    conky)
	if [[ "${WEATHER_MAIN}" ]]; then
		echo "${WEATHER_TEMP}${SYMBOL_CELSIUS},${WEATHER_MAIN}"
	else
		echo " N/A${SYMBOL_CELSIUS}, N/A"
	fi
	;;
    tray)
	ICON_SUNNY=""
	ICON_NIGHTLY=""
	ICON_CLOUDY=""
	ICON_SAD=""
	ICON_RAINY=""
	ICON_STORM=""
	ICON_SNOW=""
	ICON_FOG=""

	if   [[ "${WEATHER_MAIN}" = *Snow* ]]; then
		echo "${ICON_SNOW}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *T-Storm* ]]; then
		echo "${ICON_STORM}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *Shower* || "${WEATHER_MAIN}" = *Rain* || "${WEATHER_MAIN}" = *Sleet* ]]; then
	  	echo "${ICON_RAINY}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
	  	echo "${ICON_CLOUDY}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *Dreary* ]]; then
	  	echo "${ICON_SAD}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *Haz* || "${WEATHER_MAIN}" = *Fog* ]]; then
	  	echo "${ICON_CLOUDY}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *Sunny* ]]; then
	  	echo "${ICON_SUNNY}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
	  	echo "${ICON_NIGHTLY}${WEATHER_TEMP}${SYMBOL_CELSIUS}"
		echo ""
	else
		echo"N/A ${SYMBOL_CELSIUS}"
		echo ""
	fi
	;;
    *)
	echo "error"; exit 1
	;;
esac
	
