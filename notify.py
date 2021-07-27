import telegram

telegram_http_api = "TELEGRAM_HTTP_API"
telegram_user_id = "TELEGRAM_USER_ID"

message = "NFI Repo Updated \n\n " + str(sys.argv[1]) + " \n\n Please /reload_config to load the latest version and then run /start to get that running again"

bot_binance = telegram.Bot(token=telegram_http_api)
bot_binance.send_message(chat_id=telegram_user_id, text=message)