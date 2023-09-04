fundamental_frequency = 1 / 3
fundamental_angular_freq = 2 * %pi * fundamental_frequency
harmonic_numbers = 10000
time_wave_size = 3

t = linspace(0,time_wave_size * 4, 1000 * time_wave_size)

r1 = 2  // resistance 1
r2 = 4  // resistance 2
l = 1   // inductance
c = 100*(10^(-3))   // capacitance
offset = 2.5

wave = zeros(1,length(t))

wave_amplitude = 15 / %pi

// Calculating the harmonics:
for n = 1:harmonic_numbers
    frequency_fourrier = n * fundamental_angular_freq
    fourrier_amplitude = wave_amplitude / n
    wave = (wave) - fourrier_amplitude * sin(frequency_fourrier*t)
    
    xl = %i*fourrier_amplitude*l // reactive inductance
    xc = (1 / %i*fourrier_amplitude*c) // reactive capacitance
end

wave = wave - offset

// Capacitor voltage equation:
vc = (2.5 - ((2.5/6)*2)) + wave

title('Sawtooth Voltage Source')
xlabel('Time(s)')
ylabel('Voltage(v)')
plot(t,wave)
