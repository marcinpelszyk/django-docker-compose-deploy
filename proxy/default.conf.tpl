server {
    listen ${LISTEN_PORTS};

    location /static {
        alias /vol/static;
    }

    location / {
        alias /vol/static;
    }

    location / {
        uwsgi_pass $(APP_HOST):$(APP_PORTS);
        include /etc/nginx/uwsgi_params;
        client_max_body_size 10M;
    }
}