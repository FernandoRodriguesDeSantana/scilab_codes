fundamental_frequency = 1 / 3
fundamental_angular_freq = 2 * %pi * fundamental_frequency
harmonic_numbers = 10000
time_wave_size = 3

t = linspace(0,time_wave_size * 4, 1000 * time_wave_size)

r1 = 2  // resistance 1
r2 = 4  // resistance 2
l = 1   // inductance
c = 100*10^(-3)   // capacitance
offset = 2.5
capacitor_voltage = 0

wave = zeros(1,length(t))

wave_amplitude = 15 / %pi

// Calculating the harmonics:
for n = 1:harmonic_numbers
    // Source section:
    frequency_fourrier = n * fundamental_angular_freq
    fourrier_amplitude = wave_amplitude / n
    wave = (wave) - fourrier_amplitude * sin(frequency_fourrier*t)
    
    // Impedances:
    xl = frequency_fourrier * l * %i
    xc = ((1)/(frequency_fourrier * c * %i))
    z1 = r1
    z2 = r2 + xl
    z3 = xc
    zeq = (((z2*z3)/(z2+z3)) + (z1))
    
    // Source current:
    source_current = ((wave) / (zeq))
    capacitor_current = ((source_current) * ((z2)/(z2+z3)))
    capacitor_voltage = ((capacitor_voltage) + ((capacitor_current) * z3))    
end

wave = wave - offset

// Capacitor voltage equation:
vc = (2.5 - ((2.5/6)*2)) + capacitor_voltage

title('Sawtooth Voltage Source')
xlabel('Time(s)')
ylabel('Voltage(v)')
plot(t, vc)
