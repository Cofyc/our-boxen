class people::cofyc {
  # basic softwares
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
      "autoconf",
      "automake",
      "wget",
      "aria2",
      "unrar",
    ]:
  }

  # used by my-life
  include ruby::2_0_0_p195

  # studio.dev
  include nginx::config
  include nginx
  file { "${nginx::config::sitesdir}/studio.conf":
    content => template("people/studio.conf.erb"),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  } 
}
