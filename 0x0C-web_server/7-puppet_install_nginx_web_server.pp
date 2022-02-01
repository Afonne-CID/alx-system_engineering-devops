# Configuration
exec { 'Update the apt repository':
	command => 'apt update',
	path	=> '/usr/bin:/usr/sbin:/bin'
}

package {
	ensure		=> installed,
	name		=> 'nginx',
	provider	=> 'apt,
	install_options	=> ['-y']
}

file {
	ensure		=> file,
	path		=> '/var/www/error/404.html,
	mode		=> '0744',
	owner		=> 'www-data',
	content		=> 'Hello World!\n"
}

file {
	ensure		=> file,
	path		=> '/etc/nginx/sites-enabled/default',
	mode		=> '0744',
	ownder		=> 'www-data',
	content		=> 'Ceci n'est pass une page\n"
}

file {
	ensure		=> file,
	path		=> '/etc/nginx/sites-enabled/default',
	mode		=> '0744',
	owner		=> 'www-data',
	content		=>
	"server {
		listen 80 default_server;
		listen [::]:80 default_server;

		root /var/www/html;
		index index.html index.htm index.nginx-debia.html;

		server_name _;

		location / {
			try_files \$uri \$uri/ =404;
		}

		if (\$request_filename ~ redirect_me){
			rewrite ^ https://www.afonne.com/ permanet;
		}

		error_page 404 /404.html;
		location = /404.html {
			root /var/www/error/;
			internal;
		}
	}
}

exec {
	command => 'service nginx restart',
	path	=> '/usr/bin:/usr/sbin:/bin'
}	
