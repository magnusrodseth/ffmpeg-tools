# FFmpeg Tools

A collection of high-level scripts to interact with FFmpeg in an easier way. This repository organizes useful FFmpeg operations into categories for audio, video, and image processing.

## Requirements

- FFmpeg installed on your system
- Bash shell

## Structure

The repository is organized into the following directories:

- `video/`: Scripts for video processing
- `audio/`: Scripts for audio processing
- `image/`: Scripts for image processing

## Available Tools

### Video

#### compress.sh

Compresses videos using H.264 encoding with a reasonable compression ratio.

```bash
./video/compress.sh "*.mp4"
```

**Features:**

- Supports wildcard glob patterns
- Creates a separate compressed/ directory for output files
- Shows size comparison between original and compressed files

## Installation

Clone this repository and make the scripts executable:

```bash
git clone https://github.com/yourusername/ffmpeg-tools.git
cd ffmpeg-tools
chmod +x video/*.sh audio/*.sh image/*.sh
```

## Contributing

Feel free to contribute new scripts or improvements to existing ones by submitting a pull request.

## License

MIT
