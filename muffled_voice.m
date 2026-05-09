function y = muffled_voice(x, fs, cutoff_norm, order)
% muffled_voice - Applies low-pass FIR filter (window method)
% cutoff_norm: normalized cutoff 0..1 (1 -> fs/2). e.g. 0.3
% order: filter order (e.g. 50 or 80)
if nargin < 3, cutoff_norm = 0.35; end
if nargin < 4, order = 50; end
b = fir1(order, cutoff_norm); % Hamming window default
y = conv(x, b, 'same');
end
