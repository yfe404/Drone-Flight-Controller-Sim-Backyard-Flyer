import matplotlib.pyplot as plt

# Parse the log file and extract relevant information
with open('Logs/TLog.txt', 'r') as file:
    lines = file.readlines()

timestamps = []
longitude = []
latitude = []

for line in lines:
    if line.startswith("MsgID.GLOBAL_POSITION"):
        data = line.split(',')
        timestamps.append(float(data[3]))
        longitude.append(float(data[2]))
        latitude.append(float(data[3]))

# Plot the drone's journey
plt.figure(figsize=(10, 6))
plt.plot(longitude, latitude, marker='o', linestyle='-', color='b')
plt.title('Drone Journey')
plt.xlabel('Longitude')
plt.ylabel('Latitude')
plt.grid(True)
plt.show()

# Save the plot as an image file (e.g., PNG)
plt.savefig('drone_journey_plot.png')
