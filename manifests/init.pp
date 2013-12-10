class local_forge (
  $repository = 'forge.puppetlabs.vm',
  $ip = 'localhost',
  $protocol = 'http',
  $hosts_entry = false,
) {
  
  if $hosts_entry {
    host { $repository:
      ensure => present,
      ip     => $ip,
    }
  }

  augeas { 'Setup local forge':
    incl    => '/etc/puppetlabs/puppet/puppet.conf',
    lens    => 'Puppet.lns',
    changes => "set main/module_repository ${protocol}://${repository}",
  }

}
