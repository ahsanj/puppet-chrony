class chrony::params {
  $aws_chrony_server = true
  $package_name      = 'chrony'
  $package_ensure    = 'present'
  $config_name       = 'chrony.conf'
  $config_file_mode  = '0664'
  $servers           = '169.254.169.123'
  $service_ensure    = 'running'
  $servive_enable    = true
  $servicehasrestart = true

  $service_name = $facts['os']['family'] ? {
    'Debian' => 'chrony',
    default  => 'chrony'
 }
}
