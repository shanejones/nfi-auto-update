import telegram
import sys

telegram_http_api = "TELEGRAM_HTTP_API"
telegram_user_id = "TELEGRAM_USER_ID"

freq = "<b>Freqtrade version</b>: <code>{}</code>".format(sys.argv[1])
nfi = "<b>NFI  version</b>: <code>{}</code>".format(sys.argv[2])
comment = "<b>Comment</b>: <code>{}</code>".format(sys.argv[3])

message = freq + "\n" +  nfi + "\n" + comment + "\n" + "NFI was successfully updated."

bot_binance = telegram.Bot(token=telegram_http_api)
bot_binance.send_message(chat_id=telegram_user_id, text=message, parse_mode='HTML')
