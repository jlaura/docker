# Example nginx config

```
server {
    listen      80 default;
    server_name _;
    resolver    130.118.160.9;

    location /images/internal/ {
        auth_request /auth;
    }

    location = /auth {
        internal;
        proxy_pass http://nginx-ldap-auth:8888;
        proxy_pass_request_body off;
        proxy_set_header Content-Length "";

        proxy_set_header X-Ldap-URL         "";
        proxy_set_header X-Ldap-BaseDN      "";
        proxy_set_header X-Ldap-BindDN      "";
        proxy_set_header X-Ldap-BindPass    "";
        proxy_set_header X-Ldap-Template    "(sAMAccountName=%(username)s)";
        
        proxy_set_header X-CookieName   "nginxauth";
        proxy_set_header Cookie         nginxauth=$cookie_nginxauth;
    }

    location / {
        proxy_pass http://tomcat:8080/;
    }
}
```
