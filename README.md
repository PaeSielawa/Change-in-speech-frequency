# Audio Frequency Modification

This MATLAB project allows you to modify audio frequency in two different ways:
- Time-stretching (changing playback speed)
- Pitch-scaling (changing pitch)

## Features

- **Time-stretching**:
  - Modify speed by multiplication factor
  - Modify speed by Hz value
- **Pitch-scaling**:
  - Modify pitch by semitones
  - Modify pitch by Hz value

## Requirements

- MATLAB
- Audio Processing Toolbox
- Signal Processing Toolbox

## Usage

1. Run `Program_PSDOKS.m` in MATLAB
2. Choose one of four modification methods:
   - Time-stretching with multiplication factor
   - Time-stretching with Hz
   - Pitch-scaling with semitones
   - Pitch-scaling with Hz
3. Input the desired value when prompted
4. The program will:
   - Play the modified sound
   - Display time domain plots
   - Display frequency domain plots

## Example Input Values

- For time-stretching with multiplication: Try values between 0.5 (slower) and 2.0 (faster)
- For time-stretching with Hz: Try values between -1000 and +1000
- For pitch-scaling with semitones: Try values between -12 and +12
- For pitch-scaling with Hz: Try values between -1000 and +1000

## Visualization

The program generates two figures for each modification:
1. Time domain comparison (original vs modified)
2. Frequency domain comparison (original vs modified)

## License

This project was created by PS. All rights reserved.
