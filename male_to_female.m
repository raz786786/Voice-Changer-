function y = male_to_female(x, fs)
% male_to_female - Simple male->female approximation using pitch up + emphasis
% Steps:
% 1) Pitch up using resampling (ratio ~ 0.85 -> ~18% higher)
% 2) Pre-emphasis (high frequency boost) to mimic brighter formants
% 3) Optional mild low-pass to remove artifacts
% This is a basic DSP approach suitable for lab demonstration.

% 1) Pitch up (shorter)
ratio = 1/1.18; % increase pitch by ~18%
[p,q] = rat(1/ratio, 1e-6);
y1 = resample(x, p, q);

% 2) Pre-emphasis: y[n] = x[n] - a*x[n-1]; a ~ 0.95
a = 0.95;
y2 = filter([1 -a], 1, y1);

% 3) Mild smoothing lowpass to reduce artifacts
b = fir1(40, 0.95); % gentle smoothing (almost pass-through)
y = conv(y2, b, 'same');

% Trim/normalize
y = y / max(1e-8, max(abs(y)));
end
