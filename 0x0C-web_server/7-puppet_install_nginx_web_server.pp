# Install Nginx
class nginx_server {
  package { 'nginx':
    ensure => 'installed',
  }

  service { 'nginx':
    ensure => 'running',
    enable => true,
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx_server/default.erb'),
    notify  => Service['nginx'],
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
  }
}

class nginx_redirect {
  nginx_server::config { 'redirect':
    listen_port   => '80',
    server_name   => 'localhost',
    redirect_path => '/redirect_me',
    redirect_code => '301',
    target_url    => 'http://www.example.com/',
  }
}

class nginx_server::config(
  String $listen_port,
  String $server_name,
  String $redirect_path,
  String $redirect_code,
  String $target_url,
) {
  $nginx_config = "
    server {
      listen ${listen_port};
      server_name ${server_name};

      location / {
        root /var/www/html;
        index index.html;
      }

      location ${redirect_path} {
        return ${redirect_code} ${target_url};
      }
    }
  "

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => $nginx_config,
    notify  => Service['nginx'],
  }
}

