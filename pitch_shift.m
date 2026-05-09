function y = pitch_shift(x, fs, ratio)
% pitch_shift - Simple pitch shift by resampling (changes duration)
% ratio < 1 : pitch up (shorter), ratio > 1 : pitch down (longer)
% This is a simple method (duration change). For constant duration use a phase-vocoder.
if nargin < 3, ratio = 1.0; end
% Use resample to change sampling rate: new_fs = fs/ratio -> resample(x, p, q)
% We want y(t) = x(t/ratio) => resample by p/q = 1/ratio
[p,q] = rat(1/ratio, 1e-6);
y = resample(x, p, q);
end
