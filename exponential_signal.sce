amp = 1; // SIGNAL AMPLITUDE
t = 0:0.001:10; // SIGNAL PERIOD
a = 1 // DECAY COEFFICIENT

y = amp * exp(-a*t); // EXPONENTIAL FUNCTION

clf; // CLEAR FIGURE
plot(t, y); // PLOTTING THE SIGNAL
xlabel("t");
ylabel("y(t)");
title("Exponential Signal");
