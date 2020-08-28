# CAS authentication with nginx
See https://github.com/EsupPortail/nginx-auth-cas-lua

Needs the following:

Mounted at `/usr/local/openresty/lualib/global_cas_conf.lua`:
```lua
return {
   cas_uri = "...";   

   -- Optional
   -- store_name = "cas_store";
   -- session_lifetime = 3600;
   -- cookie_name = "NGXCAS";
   -- cookie_params = "; Path=/; Secure; HttpOnly";
}
```

In the nginx location block(s) to be protected:
```
location / {
    access_by_lua_block { require('cas').forceAuthentication() }

    ...
}
```
