// Package weather provides tools to record and report the current 
// meteorological conditions for various cities across Goblinocus.
package weather

var (
    // CurrentCondition stores the state of the weather (e.g., "Rainy", "Sunny").
	CurrentCondition string
    // CurrentLocation stores the name of the city being forecasted.
	CurrentLocation  string
)
// Forecast updates the current location and condition variables, 
// and returns a formatted string announcing the weather for that city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
