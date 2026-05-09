function save_audio(x, fs, filename)
% save_audio - Writes a WAV file (16-bit)
audiowrite(filename, x, fs);
end
