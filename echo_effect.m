function y = echo_effect(x, fs, delay_seconds, gain)
% echo_effect - Adds a single echo: y[n] = x[n] + gain * x[n - D]
% delay_seconds (e.g. 0.3), gain (e.g. 0.5)
if nargin < 4, gain = 0.5; end
D = round(delay_seconds * fs);
h = zeros(D+1,1);
h(1) = 1;
h(end) = gain;
y = conv(x, h);
% Trim or scale to original length (optional). We'll keep full convolved length.
end
