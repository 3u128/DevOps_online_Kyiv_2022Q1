# Task 6
## A. 

When starting without parameters, it will display a list of possible keys and their description.  
--all displays the IP addresses and symbolic names of all hosts in the current subnet  
--target displays a list of open system TCP ports. 

### for executable change mod:
chmod +x netinfo.sh
run by ./netinfo.sh

## B.
Using Apache log example create a script to answer the following questions: 
1. From which ip were the most requests?  
   ```awk '{ print $1 }' apache_logs.txt | uniq -c | awk '{ print $1, $2}' | sort -g -r | head -n 3```
   ```
   grep ' 200 ' example_log.log | awk '{ print $7 }' | grep -v robots | grep -v favicon | grep -v sitemap | grep -v php | sort | uniq -c | awk '{ print $1 }' | sort -g | tail -n 1

	where grep -v = besides something content
	uniq -c = count
	sort -g = compare by numeric
        grep ' 200 ' - search available sites
   ```
2. What is the most requested page?
   ``` awk {'print $7'} example_log.log | sort | uniq -c | sort -nk1 ```

   ```
   27 /ukhod-za-soboj/molodost/omolozhenie-lica-posle-50-let.html
   33 /ukhod-za-soboj/pokhudenie/furosemid-dlya-pokhudeniya.html
   190 /wp-content/uploads/2014/11/favicon.ico
   ```
3. How many requests were there from each ip?  
   ```
   19 176.108.5.105
   21 95.31.14.165
   29 94.78.95.154
   b2q@thinkpad ~/.../m6/task1 $ awk {'print $1'} example_log.log | sort | uniq -c | sort -nk1
   ```
4. What non-existent pages were clients referred to?  
   ```
   grep '" 404' example_log.log | awk '{ print $7 }' 
   ```
5. What time did site get the most requests?  
   ```
   awk '{ print $4 }' example_log.log | awk -F: '{ print $2 }' | sort -g | uniq -c

     36 08
    210 09
    192 10
    253 11
    249 12
     60 13
   ```

6. What search bots have accessed the site? (UA + IP)

   ua - user agent

   ```
$16"+ IP:"$1}' | sort -n | uniq -c
      1 UA: "Mozilla/5.0(compatible;GrapeshotCrawler/2.0;+http://www.grapeshot.co.uk/crawler.php)"+ IP:89.145.95.69
     11 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.234
      8 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.235
      9 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.236
      3 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.237
      5 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.238
     12 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.239
      6 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.240
      6 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/2.0;+ IP:217.69.133.70
      6 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.12
      2 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.13
      2 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.14
      1 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.15
      5 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.29
      1 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.30
      1 UA: "Mozilla/5.0(compatible;Linuxx86_64;Mail.RU_Bot/Fast/2.0;+ IP:217.69.134.39
      2 UA: "Mozilla/5.0(compatible;MJ12bot/v1.4.7;http://mj12bot.com/)"+ IP:144.76.76.115
      1 UA: "Mozilla/5.0(compatible;YandexBot/3.0;+http://yandex.com/bots)"+ IP:5.255.251.28
      1 UA: "Twitterbot/1.0"+ IP:199.16.157.182
      b2q@thinkpad ~/.../m6/task1 $ grep robots example_log.log | awk '{ print "UA: "$12 $13 $14 $15 $16"+ IP:"$1}' | sort -n | uniq -c
   ```
task1/apache_logs.txt
task1/example_log.log

## C.

Create a data backup script that takes the following data as parameters: 
 - Path to the syncing  directory. 
 - The path to the directory where the copies of the files will be stored. 

In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]

