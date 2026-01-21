#Sensor readings taken every minute for 60 minutes
temperature <- c(28,29,30,31,32,33,34,35,36,34,33,32,31,30,29,28,27,26,28,29,30,31,32,33,34,35,36,37,38,36,35,34,33,32,31,30,29,28,27,26,28,29,30,31,32,33,34,35,36,34,33,32,31,30,29,28)
humidity <- c(45,44,43,42,41,39,38,37,36,38,39,40,41,42,43,44,45,46,44,43,42,41,40,39,38,37,36,35,34,36,37,38,39,40,41,42,43,44,45,46,44,43,42,41,40,39,38,37,36,38,39,40,41,42,43,44)
pressure <- c(1012,1013,1014,1015,1016,1015,1014,1013,1012,1011,1010,1011,1012,1013,1014,1015,1016,1017,1016,1015,1014,1013,1012,1011,1010,1011,1012,1013,1014,1015,1016,1015,1014,1013,1012,1011,1010,1011,1012,1013,1014,1015,1016,1017,1016,1015,1014,1013,1012,1011,1010,1011,1012,1013,1014,1015)
#Calculating average readings
avg_temp <- mean(temperature)
avg_humidity <- mean(humidity)
avg_pressure <- mean(pressure)
#Identifying time intervals based on conditions
condition_minutes <- which(temperature > 30 & humidity < 40)
#Plotting sensor readings over time
plot(temperature, type="l", col="red", xlab="Time (minutes)", ylab="Sensor Values")
lines(humidity, col="blue")
lines(pressure/40, col="green")
#Displaying the results
cat("Average temperature:", avg_temp, "\n")
cat("Average humidity:", avg_humidity, "\n")
cat("Average pressure:", avg_pressure, "\n")
cat("Minutes where temperature > 30 and humidity < 40:", condition_minutes, "\n")