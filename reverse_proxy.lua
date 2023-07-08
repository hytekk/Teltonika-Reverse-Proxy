#!/usr/bin/env lua

local socket = require("socket")
local http = require("socket.http")
local url = require("socket.url")

-- Configuration
local local_port = 3333 -- Replace with the desired local port
local teltonika_ip = "192.168.1.1" -- Replace with the actual IP of your Teltonika router
local username = "username" -- Replace with the actual username of your SMS Gateway user
local password = "password" -- Replace with the actual password of your SMS Gateway user
local recipient_number = "0037000000000" -- Replace with the recipient's phone number

-- Function to send an SMS using the Teltonika router's API
local function send_sms(number, text)
    local sms_url = string.format(
        "http://%s/cgi-bin/sms_send?username=%s&password=%s&number=%s&text=%s",
        teltonika_ip,
        url.escape(username),
        url.escape(password),
        url.escape(number),
        url.escape(text)
    )
    local res, status, headers = http.request(sms_url)

    if status == 200 then
        -- Check if there is a mobile connection
        if res == "ERROR: No connection" then
            return "Failed to send SMS. No mobile connection."
        else
            return "SMS sent successfully"
        end
    else
        return "Failed to send SMS. HTTP Status: " .. tostring(status)
    end
end

-- Start reverse proxy
local server_socket = socket.tcp()
server_socket:setoption("reuseaddr", true)
server_socket:bind("0.0.0.0", local_port)
server_socket:listen(1)

print("Reverse proxy started, listening on port " .. local_port)

while true do
    local client_socket = server_socket:accept()
    local request = client_socket:receive("*l")

    -- Extract the request method and path
    local method, path = request:match("(%a+)%s+(/.-)%s+HTTP")

    print("Received request:", method, path)

    -- Perform different actions based on the requested endpoint
    if path == "/trigger-sms" then
        -- Trigger the SMS with the appropriate message
        local sms_result = send_sms(recipient_number, "Trigger-sms")
        client_socket:send("HTTP/1.1 200 OK\r\nContent-Length: " .. #sms_result .. "\r\n\r\n" .. sms_result)
    elseif path == "/trigger-sms2" then
        -- Trigger the SMS with the appropriate message
        local sms_result = send_sms(recipient_number, "Trigger-sms2")
        client_socket:send("HTTP/1.1 200 OK\r\nContent-Length: " .. #sms_result .. "\r\n\r\n" .. sms_result)
    elseif path == "/trigger-sms3" then
        -- Trigger the SMS with the appropriate message
        local sms_result = send_sms(recipient_number, "Trigger-sms3")
        client_socket:send("HTTP/1.1 200 OK\r\nContent-Length: " .. #sms_result .. "\r\n\r\n" .. sms_result)
    else
        -- Path not found, send a 404 Not Found response
        client_socket:send("HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n")
    end

    -- Close the client socket
    client_socket:close()
end
