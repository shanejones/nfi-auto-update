# NFI Auto Updater

This repo will help you set up auto updates on the NostalgiaForInfinityNext repo for use with freqtrade.

To install run 

```
git clone https://github.com/shanejones/nfi-auto-update
```

This command should be ran in the folder that the freqtrade and the NostalgiaForInfinity folders are located.

You'll then need to install the telegram dependencies to the server using the following:

```
pip3 install python-telegram-bot
```

Next you'll need to tweak some settings in the files.

In `notify.py` you need to replace the `TELEGRAM_HTTP_API` with your bot's Telegram API, just below this you can also replace `TELEGRAM_USER_ID`

Next we need to add a soft link (think of it as a redirect) from the NFI python strategy file to your freqtrade folder:

```
ln -s /root/NostalgiaForInfinity/NostalgiaForInfinityNext.py /root/freqtrade/user_data/strategies/NostalgiaForInfinityNext.py
```

We also need to make all the shell scripts executable:

```
chmod +x update.sh restart.sh start.sh
```

Once those settings are done, you'll need to create a cron job to run this frequently.

Log into your server and type `crontab -e`. If this is the first tiume you have run this it will ask you which editor you want to use to edit. Choose nano if that is more familiar to you.

Next you should be editing the cron file, add in the following line at the bottom of the file. This will run every 2/7/12/17...52/57 minutes past the hour and it does will not clash with the with the 5 min candles calculations. h/t @abanchev for this tip! We can also add an option to automatically start the bot should the server reboot for whatever reason.

```
2-59/5 * * * * /bin/bash -c "/root/nfi-auto-update/update.sh"
@reboot sleep 10; /bin/bash -c "/root/nfi-auto-update/start.sh"
```

This final part of that command should resolve to the `update.sh` and `start.sh` files. 

Once that is saved, the updater will check for new git updates every 5 mins and notify you via Telegram of the changes and version number, before automatically reloading.
