function y = alien_voice(x, fs, cutoff_norm, order)
% alien_voice - Applies high-pass FIR filter for "sharp/alien" tone
if nargin < 3, cutoff_norm = 0.35; end
if nargin < 4, order = 50; end
b = fir1(order, cutoff_norm, 'high');
y = conv(x, b, 'same');
end
