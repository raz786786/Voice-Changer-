% voice_changer_main.m
% Main script to demonstrate voice changer effects
clc; clear; close all;

% ---- Parameters ----
input_filename = 'voice.wav';   
output_basename = 'output_';   
% ---- Load and preprocess ----
[x, fs] = load_audio(input_filename);
x = normalize_audio(x);

% Display basic info
fprintf('Loaded "%s" — fs=%d, duration=%.2f s\n', input_filename, fs, length(x)/fs);

% Simple menu
effects = { 'Echo', 'Pitch Up (male->female style)', 'Pitch Down', ...
            'Robot', 'Muffled (LPF)', 'Alien (HPF)', 'Male -> Female (combo)', 'Plot Spectrum', 'Exit' };

while true
    fprintf('\nSelect effect:\n');
    for k=1:length(effects)
        fprintf(' %2d: %s\n', k, effects{k});
    end
    choice = input('Enter choice number: ');
    if isempty(choice) || choice < 1 || choice > length(effects)
        disp('Invalid choice, try again.');
        continue;
    end
    if choice == length(effects) % Exit
        break;
    end

    switch choice
        case 1 % Echo
            y = echo_effect(x, fs, 0.35, 0.55); % delay(s), gain
            fn = [output_basename 'echo.wav'];
        case 2 % Pitch up
            y = pitch_shift(x, fs, 1/1.2); % ratio <1 => pitch up (shorter)
            fn = [output_basename 'pitch_up.wav'];
        case 3 % Pitch down
            y = pitch_shift(x, fs, 1.2); % ratio >1 => pitch down (longer)
            fn = [output_basename 'pitch_down.wav'];
        case 4 % Robot
            y = robot_voice(x, fs, 256, 0.5); % frame,N,overlap ratio
            fn = [output_basename 'robot.wav'];
        case 5 % Muffled (LPF)
            y = muffled_voice(x, fs, 0.35, 80); % norm cutoff (0..1), order
            fn = [output_basename 'muffled.wav'];
        case 6 % Alien (HPF)
            y = alien_voice(x, fs, 0.35, 80);
            fn = [output_basename 'alien.wav'];
        case 7 % Male -> Female
            y = male_to_female(x, fs);
            fn = [output_basename 'male_to_female.wav'];
        case 8 % Plot spectrum
            plot_spectrum(x, fs, 'Original Signal');
            continue;
    end

    % Normalize and play
    y = y / max(1e-8, max(abs(y)));
    sound(y, fs);

    % Save
    save_audio(y, fs, fn);
    fprintf('Saved: %s\n', fn);

    % ---- Time-domain comparison (NEW) ----
plot_time_comparison(x, y, effects{choice});

% ---- Frequency-domain (optional but good) ----
plot_spectrum(x, fs, 'Original Signal Spectrum');
plot_spectrum(y, fs, ['Result Spectrum - ' effects{choice}]);
end

disp('Exited.'); 
