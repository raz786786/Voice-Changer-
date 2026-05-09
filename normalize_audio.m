function y = normalize_audio(x)
% normalize_audio - Scale signal to [-1,1] range
mx = max(abs(x));
if mx == 0
    y = x;
else
    y = x / mx;
end
end
