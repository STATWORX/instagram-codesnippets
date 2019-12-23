# Send mails with python & gmail using built-in modules
import smtplib, ssl

# For the SMTP (Simple Mail Transfer Protocol) connection
smtp_server = "smtp.gmail.com"
port = 465 

# Mail details
sender = "statworxdev@gmail.com"
password = input("Enter your password here:")
receiver = "statworxdev@gmail.com"
message = """\
From: {}
To: {}
Subject: Aloha!

This message was sent using Python!
""".format(sender, receiver)

# Intitialize a SSL context object with default settings
context = ssl.create_default_context()

with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
    # Authentication
    server.login(sender, password)
    # Send mail
    server.sendmail(sender, receiver, message)
    # Success
    print("Mail was sent!")
