clf(); // clear

// Set the time
t = -5:0.1:5;

// Define the impulse function using the Heaviside function
impulse = zeros(1, length(t)); // Initialize the vector to zero
impulse(t == 0) = 1;            // Set the impulse at t = 0

// Plot the impulse function
plot(t, impulse, 'r');
xlabel("Time (s)");
ylabel("Amplitude");
title("Impulse function");
xgrid();  // Add a grid
