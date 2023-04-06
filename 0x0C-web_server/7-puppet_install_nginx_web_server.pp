# Install Nginx
class { 'nginx': }

# Configure Nginx server
nginx::resource::server { 'HOSTNAME':
  listen_port => 80,
  server_name => 'HOSTNAME',
  location    => {
    '/'           => {
      content => 'Hello World!',
    },
    '/redirect_me' => {
      ensure      => 'present',
      return      => '301',
      rewrite_log => 'on',
      content     => '',
      location    => 'http://example.com/new_page.html',
    },
  },
}
