# This class start and manages the chrony service
class chrony::service (
  String $service_name    = $chrony::service_name,
  String $service_ensure  = $chrony::service_ensure,
  $service_enable         = $chrony::service_enable,
  $service_hasstatus      = $chrony::service_hasstatus,
  $service_hasrestart     = $chrony::service_hasrestart,
) {
  service { 'chrony':
    ensure     => $service_ensure,
    name       => $service_name,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
  }
}
