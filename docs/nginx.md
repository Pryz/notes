**Server example with php-fpm.**

    server {
            server_name sanfrancisco.pryz.fr;

            access_log   /var/log/nginx/sf.pryz.access.log;
            error_log    /var/log/nginx/sf.pryz.error.log;

            root /usr/share/nginx/wordpress;
            index index.php;

            location / {
                    try_files $uri $uri/ /index.php?$args;
            }

            location ~ \.php$ {
                    try_files $uri =404;
                    include fastcgi_params;
                    fastcgi_pass unix:/var/run/php5-fpm.sock;
            }
    }

**Test Nginx conf.**

    nginx -t
