#!/usr/bin/env python

import smtplib, glob, os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email.mime.image import MIMEImage
from email import encoders
from config import *

msg = MIMEMultipart()
 
msg['From'] = fromAddr
msg['To'] = toAddr
msg['Subject'] = "[Security alert] Someone has opened the laptop lid!"
 
body = "Take a look at these photos: "
msg.attach(MIMEText(body, 'plain'))

path = "/opt/WebcamGuard/"
jpgfiles = glob.glob( os.path.join(path, "*.jpg") )
for file in jpgfiles:
    fp = open(file, 'rb')
    img = MIMEImage(fp.read())
    fp.close()
    msg.attach(img)
 
server = smtplib.SMTP(smtpServer, smtpPort)
server.starttls()
server.login(fromAddr, password)
text = msg.as_string()
server.sendmail(fromAddr, toAddr, text)
server.quit()

