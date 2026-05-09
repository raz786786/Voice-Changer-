# Voice Changer App Report

## Project Overview

This MATLAB project is a voice changer application that loads an input audio file, applies a variety of audio effects, and saves the transformed output. The app is built around `voice_changer_main.m` and uses helper functions for loading, processing, plotting, and saving audio.

## Supported Effects

The app offers the following audio transformations:

- **Echo** (`echo_effect.m`)
  - Adds a single echo to the original signal using delay and feedback gain.

- **Pitch Up** (`pitch_shift.m`)
  - Raises pitch by resampling the audio signal, producing a shorter, higher voice.

- **Pitch Down** (`pitch_shift.m`)
  - Lowers pitch by resampling, producing a longer, deeper sound.

- **Robot** (`robot_voice.m`)
  - Creates a robotic sound by preserving magnitude and removing original phase information.

- **Muffled** (`muffled_voice.m`)
  - Applies a low-pass FIR filter for a softened, muffled tone.

- **Alien** (`alien_voice.m`)
  - Applies a high-pass FIR filter to create a sharper, alien-like effect.

- **Male -> Female** (`male_to_female.m`)
  - Approximates a female-style voice using pitch increase, pre-emphasis, and gentle smoothing.

- **Plot Spectrum** (`plot_spectrum.m`)
  - Displays the magnitude spectrum of the original signal.

## Main Script Behavior

The main script `voice_changer_main.m` follows these steps:

1. Load `voice.wav` using `load_audio.m`.
2. Convert audio to mono and normalize the signal.
3. Present a menu of available effects.
4. Apply the selected effect.
5. Normalize, play, and save the processed audio.
6. Plot a time-domain comparison of original versus processed audio.
7. Plot frequency-domain spectra for both original and processed signals.

## Expected Outputs

When a user chooses an effect, the app saves one of these files:

- `output_echo.wav`
- `output_pitch_up.wav`
- `output_pitch_down.wav`
- `output_robot.wav`
- `output_muffled.wav`
- `output_alien.wav`
- `output_male_to_female.wav`

The application also displays:

- Time-domain comparison plot of original and processed audio.
- Spectrum plot of the original audio.
- Spectrum plot of the processed audio.

## Sample Output

A typical MATLAB console session looks like this:

```text
Loaded "voice.wav" — fs=44100, duration=3.21 s

Select effect:
 1: Echo
 2: Pitch Up (male->female style)
 3: Pitch Down
 4: Robot
 5: Muffled (LPF)
 6: Alien (HPF)
 7: Male -> Female (combo)
 8: Plot Spectrum
 9: Exit
Enter choice number: 1
Saved: output_echo.wav
```

When an effect is applied, the app creates these visual outputs:

- **Time-domain comparison**: original signal on top, processed signal below.
- **Original spectrum**: frequency magnitude of the source audio.
- **Result spectrum**: frequency magnitude of the processed audio with effect label.

## Usage Instructions

1. Place the input file `voice.wav` in the project folder.
2. Run `voice_changer_main.m` in MATLAB.
3. Enter the effect number when prompted.
4. Listen to the processed audio and review the generated plots.
5. Find the saved output file in the same project folder.

## Files Included

- `voice_changer_main.m`
- `VoiceChanger.mlapp`
- `load_audio.m`
- `normalize_audio.m`
- `save_audio.m`
- `echo_effect.m`
- `pitch_shift.m`
- `robot_voice.m`
- `muffled_voice.m`
- `alien_voice.m`
- `male_to_female.m`
- `plot_spectrum.m`
- `plot_time_comparison.m`

## Notes

- The app uses simple DSP methods that are suitable for demonstration and lab experiments.
- Pitch shifting is implemented by resampling, so duration changes along with pitch.
- The report is based on the current app flow and helper functions in this project.
