#! /usr/bin/env python
import httplib, urllib

if __name__ == '__main__':
    # Init variables
    host        = 'Your servers host'
    device_id   = 42
    secret      = 'Your secret'
    data        = {}

    conn = httplib.HTTPConnection(host)

    # Send data to server
    params = urllib.urlencode({ 'secret': secret, 'measurement': { 'data': data } })
    headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
    conn.request("POST", "/devices/" str(device_id) "/measurements", params, headers)
    response = conn.getresponse()
    # print response.status, response.reason
    # data = response.read()
    # print data

    # End script
    conn.close()
