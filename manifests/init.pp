class chrony(
 String $package_name     = $chrony::params::package_name,
 String $package_ensure   = $chrony::params::package_ensure,
 String $config_name      = $chrony::params::config_name,
 String $config_file_mode = $chrony::params::config_file_mode,
 $aws_chrony_server       = $chrony::params::aws_chrony_server,
 $service_ensure          = $chrony::params::service_ensure,
 $service_name            = $chrony::params::service_name,
 $service_enable          = $chrony::params::service_enable,
 $service_hasrestart      = $chrony::params::service_hasrestart,
 $service_hasstatus       = $chrony::params::service_hasstatus,
) inherits ::chrony::params {
  class { '::chrony::install' : }
  -> class { '::chrony::config' : }
  ~> class { '::chrony::service' : }
}
