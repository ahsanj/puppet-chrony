class chrony::config (
  String $config_name      = $chrony::config_name,
  String $config_file_mode = $chrony::config_file_mode,
  $aws_chrony_server       = $chrony::aws_chrony_server,
  $config_loc              = $chrony::config_loc,
  $server                  = $chrony::server,
  $template                = $chrony::template,
) { 
   file { "${config_loc}":
     ensure  => file,
     owner   => 'root',
     group   => 'root',
     mode    => $config_file_mode,
     content => template("$module_name/${template}.erb")
 }
}

