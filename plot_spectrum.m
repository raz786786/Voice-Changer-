function plot_spectrum(x, fs, title_str)
% plot_spectrum - Plot magnitude spectrum (DTFT/FFT) of signal x
if nargin < 3, title_str = 'Spectrum'; end
N = 2^nextpow2(length(x));
X = fft(x, N);
f = (0:N-1)*(fs/N);
mag = abs(X);
figure;
plot(f(1:N/2), 20*log10(mag(1:N/2)+1e-12));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title(title_str);
grid on;
end
