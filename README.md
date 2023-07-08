# Teltonika HTTP Reverse Proxy

This repository contains a Lua script that acts as an HTTP reverse proxy for Teltonika devices. It receives incoming HTTP POST requests from other machines on the network and converts them into HTTP GET requests, forwarding them to a specified destination URL.

## Features

- Acts as an HTTP reverse proxy for Teltonika devices
- Receives incoming HTTP POST requests and converts them to HTTP GET requests
- Forwards converted requests to a destination URL
- Customizable destination URL and other parameters
- Written in Lua

## Usage

1. Configure the Teltonika device to send HTTP POST requests to the reverse proxy script's URL.
2. Customize the reverse proxy script to define the destination URL and any additional request parameters.
3. Run the reverse proxy script on the Teltonika device.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repository.git
   ```

2. Edit the configuration in the script (`reverse_proxy.lua`) to set the destination URL and other parameters as needed.

3. Run the script on your Teltonika device:
   ```bash
   lua reverse_proxy.lua
   ```

## Contributions

Contributions are welcome! If you have suggestions, improvements, or bug fixes, feel free to submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
