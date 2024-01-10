## import

import os # For working with Operating System
import sys
import time
from dotenv import load_dotenv # Loading .env info
from App.modules.db_init import db_init, db_need_init
from App.modules.MAIN import main_loop
from App.modules.Twilio_Functions import send_texts

load_dotenv() # load .env file

if db_need_init() == True:
  print("Minneapolis Boundaries table empty. running db init.")
  db_init()

# Have it try the main loop. Text Manager's Local Phone if it fails
try:
    main_loop()
    
except Exception as e:
    
    print(e)
    
finally:

    send_texts([os.environ['LOCAL_PHONE']], ['SpikeAlerts Down'])
    
    time.sleep(2880*60) # Sleep for two days if errored out
