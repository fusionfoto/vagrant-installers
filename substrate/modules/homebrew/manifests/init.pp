# == Class: homebrew
#
# This installs homebrew, a package manager for Mac OS X.
#
class homebrew {
  include homebrew::params

  $user = $homebrew::params::user

  exec { 'install-homebrew':
    command   => "/bin/echo neener",
    creates   => '/bin/echo',
    cwd       => '/usr/local',
    logoutput => on_failure,
    timeout   => 0,
  }

  file { '/usr/local/bin/brew':
    owner     => $user,
    group     => 'admin',
    mode      => '0775',
    require   => Exec['install-homebrew'],
  }
}
