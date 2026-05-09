function [x, fs] = load_audio(filename)
% load_audio - Loads audio and returns mono signal and sampling rate
% usage: [x, fs] = load_audio('voice.wav')
[x, fs] = audioread(filename);
if size(x,2) > 1
    x = mean(x,2); % convert to mono
end
end
