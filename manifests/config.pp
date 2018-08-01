class chrony::config (
  String $config_name      = $chrony::config_name,
  String $config_file_mode = $chrony::config_file_mode,
  $aws_chrony_server       = $chrony::aws_chrony_server,
  $config_loc              = $chrony::config_loc,
  $template                = $chrony::template,
) { 
   file { "${config_loc}":
     ensure  => file,
     owner   => 0,
     group   => 0,
     mode    => $config_file_mode,
     content => template("$module_name/${template}.erb")
 }
}

