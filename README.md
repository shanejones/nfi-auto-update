# NFI Auto Updater

This repo will help you set up auto updates on the NostalgiaForInfinityNext repo for use with freqtrade.

To install, `git clone` this repo into the root of your server. This should be in the same folder that freqtrade and the NostalgiaForInfinity folder is.

You'll then need to install the telegram dependencies to the server using the following

```
pip3 install python-telegram-bot
```

Next you'll need to tweak some settings in the files.

In `notify.py` you need to replace the `TELEGRAM_HTTP_API` with your bot's Telegram API, just below this you can also replace `TELEGRAM_USER_ID`

In `update.sh`, make sure that line 2 resolves to your NostalgiaForInfinry repo. On line 8, make sure that second part of the copy command is the location of your strategy file. Finally on line 9, make sure that path is the location of your `notify.py` script.

Once those settings are done, you'll need to create a cron job to run this frequently.

Log into your server and type `crontab -e`. If this is the first tiume you have run this it will ask you which editor you want to use to edit. Choose nano if that is more familiar to you.

Next you should be editing the cron file, add in the following line at the bottom of the file.
```
*/30 * * * * /bin/bash -c "/root/nfi-updater/update.sh"
```
This final part should resolve to the `update.sh` file. 

Once that is saved, the updater will check for new git updates every 30 mins and notify you via Telegram if there was anything new so you can restart it.