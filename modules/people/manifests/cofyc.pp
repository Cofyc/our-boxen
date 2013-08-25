class people::cofyc {
  package {
    [
      "coreutils",
      "ascii",
      "bash",
      "bash-completion",
      "cmake",
      "ctags",
      "curl",
      "gnu-indent",
      "gnu-sed",
      "irssi",
      "mercurial",
      "p7zip",
    ]:
  }

  # studio.dev
  include nginx::config
  include nginx
  file { "${nginx::config::sitesdir}/studio.conf":
    content => template("people/studio.conf.erb"),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  } 
}
