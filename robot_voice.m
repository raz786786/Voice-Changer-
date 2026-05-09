function y = robot_voice(x, fs, N, overlap_ratio)
% robot_voice - Makes signal robotic by modifying phase per-frame
% N: frame length (e.g. 256), overlap_ratio: 0..1 (e.g. 0.5)
if nargin < 3, N = 256; end
if nargin < 4, overlap_ratio = 0.5; end
hop = round(N*(1-overlap_ratio));
len = length(x);
y = zeros(len + N, 1); % small extra for last frame
win = hamming(N);

idx = 1;
write = 1;
while idx + N - 1 <= len
    frame = x(idx:idx+N-1) .* win;
    X = fft(frame);
    % Keep magnitude, destroy phase (or set phase to zero)
    Xmod = abs(X);
    frame_out = real(ifft(Xmod));
    % Overlap-add
    y(write:write+N-1) = y(write:write+N-1) + frame_out;
    idx = idx + hop;
    write = write + hop;
end
% Trim to original length
y = y(1:len);
% Normalize
y = y / max(1e-8, max(abs(y)));
end
