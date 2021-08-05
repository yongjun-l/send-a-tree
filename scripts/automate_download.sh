#!/usr/bin/env bash

# Date: 06.27.21~07.02.21
# Description: This is a script that will download the latest data logs from the server, sort them according to their log types,
#	       copy the data to the POSTGRES SQL server tables. It is automatically executed on 00:00(UTC) daily.

string=$(ls /home/yongjun/jds_june/dataset/unsorted/ -v | tail -1)
curr=${string:4:6}

last_day=$((curr+10))

while [ $curr -lt $last_day ]
do
wget -P /home/yongjun/jds_june/dataset/unsorted 46.101.230.157/jds_june_2021/day_$((curr+1))
i=$(ls /home/yongjun/jds_june/dataset/unsorted/ -v|tail -1)

if [ $i == day_$((curr+1)) ]
then
grep registration /home/yongjun/jds_june/dataset/unsorted/day_$((curr+1)) >> /home/yongjun/jds_june/dataset/registration/day_$((curr+1))_reg
grep free /home/yongjun/jds_june/dataset/unsorted/day_$((curr+1)) >> /home/yongjun/jds_june/dataset/free_tree/day_$((curr+1))_free
grep super /home/yongjun/jds_june/dataset/unsorted/day_$((curr+1)) >> /home/yongjun/jds_june/dataset/super_tree/day_$((curr+1))_super

database="postgres"
reg="/home/yongjun/jds_june/dataset/registration/day_$((curr+1))_reg"
free="/home/yongjun/jds_june/dataset/free_tree/day_$((curr+1))_free"
super="/home/yongjun/jds_june/dataset/super_tree/day_$((curr+1))_super"

psql -d $database -c "COPY registration FROM '$reg' DELIMITER ' ';"
psql -d $database -c "COPY free_tree FROM '$free' DELIMITER ' ';"
psql -d $database -c "COPY super_tree FROM '$super' DELIMITER ' ';"

fi

curr=$((curr+1))
done


: <<'END'
Tomi Answer
#!/usr/bin/env bash
index_last=$(ls -v /home/tomi/logs | grep day | tail -1 | cut -d'_' -f2)
index_yesterday=$((index_last + 1))
filename=day_$index_yesterday
wget 46.101.230.157/jds_june_2021/$filename -P /home/tomi/logs
cat /home/tomi/logs/$filename | grep 'registration' > /home/tomi/registrations/$filename
cat /home/tomi/logs/$filename | grep 'free_tree' > /home/tomi/free_tree/$filename
cat /home/tomi/logs/$filename | grep 'super_tree' > /home/tomi/super_tree/$filename
END


#Automate Email Send
psql -d $database -f daily_active_users.sql > /home/yongjun/jds_june/dataset/daily_active_users_output
psql -d $database -f daily_revenue.sql > /home/yongjun/jds_june/dataset/daily_revenue_output

mutt -s"Hello boss here are the active user numbers" yongjun.lee5@gmail.com < /home/yongjun/jds_june/dataset/daily_active_users_output
mutt -s"Hello boss here are the revenue numbers" yongjun.lee5@gmail.com < /home/yongjun/jds_june/dataset/daily_revenue_output

