#!/bin/bash
echo 'CJ'
rm /usr/src/memcached/memcached_client/servers.txt
if [ $(($1%3)) -eq 0 ]
then
    echo "dc-server0, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    echo "dc-server1, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    echo "dc-server2, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    echo "dc-server3, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    cat /usr/src/memcached/memcached_client/servers.txt
    /usr/src/memcached/memcached_client/loader \
        -a /usr/src/memcached/twitter_dataset/twitter_dataset_unscaled \
        -o /usr/src/memcached/twitter_dataset/twitter_dataset \
        -s /usr/src/memcached/memcached_client/servers.txt \
        -w 4 -S 120 -D 4096 -j
	/usr/src/memcached/memcached_client//loader \
		-a /usr/src/memcached/twitter_dataset/twitter_dataset \
		-s /usr/src/memcached/memcached_client/servers.txt \
		-g 0.8 -c 200 -w 8 -e -t 300
elif [ $(($1%3)) -eq 1 ]
then
    echo "dc-server0, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    cat /usr/src/memcached/memcached_client/servers.txt
    /usr/src/memcached/memcached_client/loader \
        -a /usr/src/memcached/twitter_dataset/twitter_dataset_unscaled \
        -o /usr/src/memcached/twitter_dataset/twitter_dataset \
        -s /usr/src/memcached/memcached_client/servers.txt \
        -w 4 -S 120 -D 4096 -j
	/usr/src/memcached/memcached_client//loader \
		-a /usr/src/memcached/twitter_dataset/twitter_dataset \
		-s /usr/src/memcached/memcached_client/servers.txt \
		-g 0.8 -c 200 -w 8 -e -t 300
else
    echo "dc-server0, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    echo "dc-server1, 11211" >> /usr/src/memcached/memcached_client/servers.txt
    cat /usr/src/memcached/memcached_client/servers.txt
    /usr/src/memcached/memcached_client/loader \
        -a /usr/src/memcached/twitter_dataset/twitter_dataset_unscaled \
        -o /usr/src/memcached/twitter_dataset/twitter_dataset \
        -s /usr/src/memcached/memcached_client/servers.txt \
        -w 4 -S 120 -D 4096 -j
	/usr/src/memcached/memcached_client//loader \
		-a /usr/src/memcached/twitter_dataset/twitter_dataset \
		-s /usr/src/memcached/memcached_client/servers.txt \
		-g 0.8 -c 200 -w 8 -e -t 300
fi
exit
