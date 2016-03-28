#! /usr/bin/env python

import httplib, urllib

if __name__ == '__main__':
    # Init variables
    host = 'localhost:3000'

    conn = httplib.HTTPConnection(host)

    # Authenticate on Server
    params = urllib.urlencode({'@number': 12524, '@type': 'issue', '@action': 'show'})
    headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
    conn.request("POST", "/device/authenticate", params, headers)
    response = conn.getresponse()
    print response.status, response.reason
    data = response.read()
    print data

    #  Send Data to Server
    conn.request("POST", "/device/data", params, headers)
    response = conn.getresponse()

    # End script
    conn.close()
