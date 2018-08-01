class chrony::install(
  String $package_name   = $chrony::package_name,
  String $package_ensure = $chrony::package_ensure,
) {
  package { 'chrony': 
    ensure => $package_ensure,
  }
}
