# drone-google-chat

[![Build Status](https://cloud.drone.io/api/badges/diogoleal/drone-google-chat/status.svg)](https://cloud.drone.io/diogoleal/drone--google-chat)

This plugin send a message in a room in Google Chat.
```
 - name: google-chat
   image: diogoleal/drone-google-chat
   settings:
    URL: "https://chat.googleapis.com/v1/spaces/XXXXXXXX/messages"
    KEY: "YOUR_KEY"
    TOKEN: "YOUR_IMAGE"
    IMAGE: "LINK_LOGO_COMPANY"
   when:
    status:
      - failure
      - success 
```


Example:

![example](example.png)