#!/bin/bash

DATA=$(curl -s \
	-H "User-Agent: waybar-weather" \
	"https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=50.45&lon=30.52"
)

TEMP=$(echo "$DATA" | jq -r '.properties.timeseries[0].data.instant.details.air_temperature')
SYMBOL=$(echo "$DATA" | jq -r '.properties.timeseries[0].data.next_1_hours.summary.symbol_code')

ICON="󰖙" # дефолт

case "$SYMBOL" in
	clearsky*) ICON="󰖙" ;;
	partlycloudy*) ICON="󰖕" ;;
	cloudy*) ICON="󰖐" ;;
	lightrain*|rain*) ICON="󰖖" ;;
	lightsnow*|snow*) ICON="󰖗" ;;
	sleet*) ICON="󰙿" ;;
	fog*) ICON="󰖑" ;;
	thunder*) ICON="󰙾" ;;
esac

printf "%s %.1f°C\n" "$ICON" "$TEMP"
