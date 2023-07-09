# Teltonika HTTP Reverse Proxy

This repository contains a Lua script that acts as an HTTP reverse proxy for Teltonika devices. It receives incoming HTTP POST requests from other machines on the network and converts them into HTTP GET requests, forwarding them to a specified destination URL.

## Features

- Acts as an HTTP reverse proxy for Teltonika devices
- Receives incoming HTTP POST requests and converts them to HTTP GET requests
- Forwards converted requests to a destination URL
- Customizable destination URL and other parameters
- Written in Lua

## Supported Commands

The reverse proxy script supports the following commands:

- HTTP GET: Used for sending GET requests from the Teltonika device to the destination URL.
- HTTP POST: Used for sending POST requests from the remote system to the Teltonika device, which are then converted to GET requests.

## Usage

1. Configure the Teltonika device to send HTTP POST requests to the reverse proxy script's URL.
2. Customize the reverse proxy script to define the destination URL and any additional request parameters.
3. Run the reverse proxy script on the Teltonika device.

## Teltonika GET Command to `sms_send`

The Teltonika device sends an HTTP GET request to the destination URL to trigger the `sms_send` command. The URL format typically looks like this:

```
http://teltonika-ip/cgi-bin/sms_send?username=user&password=password&number=recipient-number&text=message
```

Replace `teltonika-ip` with the IP address of your Teltonika device. Adjust the `username`, `password`, `number`, and `text` parameters according to your Teltonika device configuration and the specific SMS details.

## Examples

Here are examples of remote system `curl` commands for sending SMS using POST:

- HTTP POST to trigger SMS:
  ```bash
  curl -X POST "http://teltonika-ip:teltonika-port/trigger-sms" -d "recipient=phone-number&message=your-message"
  ```

- HTTP POST to trigger SMS2:
  ```bash
  curl -X POST "http://teltonika-ip:teltonika-port/trigger-sms2" -d "recipient=phone-number&message=your-message2"
  ```

- HTTP POST to trigger SMS3:
  ```bash
  curl -X POST "http://teltonika-ip:teltonika-port/trigger-sms3" -d "recipient=phone-number&message=your-message3"
  ```

Replace `teltonika-ip` with the IP address of your Teltonika device and `teltonika-port` with the port number where the reverse proxy script is running. Adjust the `recipient` and `message` parameters according to your requirements.


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

## Starting the Lua Script from `rc.local`

To automatically start the reverse proxy script on boot, you can add the following command to the `rc.local` file:

```bash
lua /path/to/reverse_proxy.lua &
```

Replace `/path/to/reverse_proxy.lua` with the actual path to the reverse proxy script on your Teltonika device.

## Contributions

Contributions are welcome! If you have suggestions, improvements, or bug fixes, feel free to submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
