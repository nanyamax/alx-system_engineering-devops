#using puppet to install nginx and create a custom header
exec { 'update':
  command     => 'apt-get -y update',
  path        => '/usr/bin',
  refreshonly => true,
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

file_line { 'add_header':
  line  => 'add_header X-Served-By $hostname;',
  path  => '/etc/nginx/nginx.conf',
  match => 'include \/etc\/nginx\/sites-enabled\/\*;',
  before => Service['nginx'],
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

