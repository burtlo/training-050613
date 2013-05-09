
* Create or Update file /etc/httpd/conf.d/httpd.conf

```bash
sudo vim /etc/httpd/conf.d/httpd.conf
sudo service httpd restart
```

Example http.conf

```
NameVirtualHost *

# Change the document root based on the request's ServerName

<VirtualHost *:*>
  ServerName 23.23.254.89
  ProxyPreserveHost On
  DocumentRoot /var/www/franklinwebber
</VirtualHost>

# Change the document root based on the request's ServerName

<VirtualHost *:*>
  ServerName frankandhannah.com
  ServerAlias *.frankandhannah.com
  DocumentRoot /var/www/frankandhannah
</VirtualHost>

# Change the document root based on the request's ServerName

<VirtualHost *:*>
  ServerName franklinwebber.com
  ServerAlias *.franklinwebber.com
  ServerAlias *.recursivegames.com rescursivegames.com
  DocumentRoot /var/www/franklinwebber
</VirtualHost>

# Change the document root based on the request's ServerName

<VirtualHost *:*>
  ServerName snowyridgetrees.com
  ServerAlias *.snowyridgetrees.com
  DocumentRoot /var/www/snowyridgetrees
</VirtualHost>

# Change the document root based on the request's ServerName

<VirtualHost *:*>
  ServerName hannahwebber.net
  ServerAlias *.hannahwebber.net
  DocumentRoot /var/www/hannahwebber
</VirtualHost>

# Change the document root based on the request's ServerName

<VirtualHost *:*>
  ServerName metroruby.com
  ServerAlias *.metroruby.com
  DocumentRoot /var/www/metroruby
</VirtualHost>

# Redirect to the server running on 3000 based on the request's ServerName

<VirtualHost *:*>
  ServerName rubymetro.com
  ServerAlias *.rubymetro.com
  #DocumentRoot /var/www/metroruby

  ProxyPass / http://localhost:3000/
  ProxyPassReverse / http://localhost:3000/
</VirtualHost>

# Redirect to the server running on 3001 based on the request's ServerName

<VirtualHost *:*>
  ServerName recursivegames.com
  ServerAlias *.recursivegames.com
  ProxyPass / http://localhost:3031
  ProxyPassReverse / http://localhost:3031/
</VirtualHost>

# Allow index.xml to be index file for a directory (e.g. index.html, index.php)

<Directory /var/www/franklinwebber/writing>
  DirectoryIndex index.xml
</Directory>
```