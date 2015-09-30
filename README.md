# nginx-auth

##Installing openresty

http://openresty.org/#Installation

OSX pitfalls:

Don't forget opensll and pcre location (installed by homebrew)
```
./configure --with-luajit --with-cc-opt="-I/usr/local/Cellar/pcre/8.37/include -I/usr/local/Cellar/openssl/1.0.2d_1/include" --with-ld-opt="-L/usr/local/Cellar/openssl/1.0.2d_1/lib -L/usr/local/Cellar/pcre/8.37/lib
```

##Installing lua rocks

Just follow this guidelines

http://openresty.org/#UsingLuaRocks

You have to remember to use the luarocks bin under openresty (instructions on the link). Usually

`/usr/local/openresty/luajit/luarocks install sha1`
