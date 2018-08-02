# puppet-chrony


## Puppet run

puppet agent -t
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Loading facts
Info: Caching catalog for ahsanjaved1.mylabserver.com
Info: Applying configuration version '1533205780'
Notice: /Stage[main]/Chrony::Install/Package[chrony]/ensure: created
Notice: /Stage[main]/Chrony::Config/File[/etc/chrony.conf]/content:
--- /etc/chrony.conf	2018-04-12 17:37:54.000000000 +0000
+++ /tmp/puppet-file20180802-3070-p1uy6j	2018-08-02 10:29:56.441525065 +0000
@@ -1,9 +1,12 @@
+####managed by puppet ######
 # Use public servers from the pool.ntp.org project.
 # Please consider joining the pool (http://www.pool.ntp.org/join.html).
-server 0.centos.pool.ntp.org iburst
-server 1.centos.pool.ntp.org iburst
-server 2.centos.pool.ntp.org iburst
-server 3.centos.pool.ntp.org iburst
+
+
+
+server 169.254.169.123 prefer iburst
+
+

 # Record the rate at which the system clock gains/losses time.
 driftfile /var/lib/chrony/drift

Notice: /Stage[main]/Chrony::Config/File[/etc/chrony.conf]/content: content changed '{md5}fcd517a062526b95db1439099d6700ee' to '{md5}d97adceda96657c6feaf8567952fc3fb'
Info: Class[Chrony::Config]: Scheduling refresh of Class[Chrony::Service]
Info: Class[Chrony::Service]: Scheduling refresh of Service[chrony]
Notice: /Stage[main]/Chrony::Service/Service[chrony]/ensure: ensure changed 'stopped' to 'running'
Info: /Stage[main]/Chrony::Service/Service[chrony]: Unscheduling refresh on Service[chrony]
Notice: /Stage[main]/Puppet_enterprise::Puppetdb/File[/var/log/puppetlabs/puppetdb/puppetdb.log]/mode: mode changed '0644' to '0640'
Notice: Applied catalog in 16.04 seconds


# IP address to synchronize the time.

chronyc sources -v
210 Number of sources = 1

  .-- Source mode  '^' = server, '=' = peer, '#' = local clock.
 / .- Source state '*' = current synced, '+' = combined , '-' = not combined,
| /   '?' = unreachable, 'x' = time may be in error, '~' = time too variable.
||                                                 .- xxxx [ yyyy ] +/- zzzz
||      Reachability register (octal) -.           |  xxxx = adjusted offset,
||      Log2(Polling interval) --.      |          |  yyyy = measured offset,
||                                \     |          |  zzzz = estimated error.
||                                 |    |           \
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* 169.254.169.123               3   6    37    51   -971ns[ -230us] +/-  479us


## Time synchronization metrics

$ chronyc tracking

Reference ID    : A9FEA97B (169.254.169.123)
Stratum         : 4
Ref time (UTC)  : Thu Aug 02 10:32:11 2018
System time     : 0.000015751 seconds fast of NTP time
Last offset     : +0.000029389 seconds
RMS offset      : 0.000217145 seconds
Frequency       : 1.374 ppm slow
Residual freq   : +0.010 ppm
Skew            : 1.162 ppm
Root delay      : 0.000674897 seconds
Root dispersion : 0.000136863 seconds
Update interval : 64.2 seconds
Leap status     : Normal





