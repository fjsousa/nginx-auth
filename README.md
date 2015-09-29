# nginx-auth

##Installing openresty on osx pitfalls

Don't forget opensll and pcre location (installed by homebrew)
```
./configure --with-luajit --with-cc-opt="-I/usr/local/Cellar/pcre/8.37/include -I/usr/local/Cellar/openssl/1.0.2d_1/include" --with-ld-opt="-L/usr/local/Cellar/openssl/1.0.2d_1/lib -L/usr/local/Cellar/pcre/8.37/lib
```
