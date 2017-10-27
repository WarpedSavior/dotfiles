#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#

#mira la conexion
STATE="error";

if [ "$STATE" == "error" ]; then
    #do a ping and check that its not a default message
    STATE=$(ping -q -w 1 -c 1 192.168.1.1 &> /dev/null && echo ok || echo error)

    if [ "$STATE" == "error" ];
    then
      echo " N/A°C, N/A"
      exit 1
    fi
fi

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
CITY_ID="EUR|ES|VC086|ALFARADELPATRIARCA"
SYMBOL_CELSIUS="°C"

WEATHER_URL="http://rss.accuweather.com/rss/liveweather_rss.asp?metric=${METRIC}&locCode=${CITY_ID}"
WEATHER_INFO=$(wget -qO- "${WEATHER_URL}" -o /dev/null)
WEATHER_MAIN=$(echo "${WEATHER_INFO}" | grep "Currently: " | awk -F ':' '{print $2}' | tr -d '"')
WEATHER_TEMP=$(echo "${WEATHER_INFO}" | grep "Currently: " | awk -F ':' '{print $3}' | cut -d 'C' -f 1 | tr -d '"')
WEATHER_LOCATION=$(echo "${WEATHER_INFO}" | grep "AccuWeather.com Forecast<" | head -1 | awk -F '>' '{print $2}' | cut -d ',' -f 1)
echo "${WEATHER_TEMP}${SYMBOL_CELSIUS},${WEATHER_MAIN}"
