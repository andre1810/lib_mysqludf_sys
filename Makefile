install:
	gcc -Wall -bundle -bundle_loader /usr/local/mysql/bin/mysqld -o lib_mysqludf_sys.so `/usr/local/mysql/bin/mysql_config --cflags` lib_mysqludf_sys.c
