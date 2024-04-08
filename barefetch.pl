#!/usr/bin/env perl

use strict;
use warnings;

# get the host 
my $host = qx(uname -n);
chomp($host);

print "╭ $host\n";

# get the os name
my $os = qx(lsb_release -i -s);
chomp($os);

# get the kernel version 
my $kernel = qx(uname -r);
chomp($kernel);

# get the amount of memory 
my $mem = qx(free -hL | awk '{print \$5, \$6, \$7, \$8}');
chomp($mem);

# get pc uptime 
my $uptime = qx(uptime -p);
chomp($uptime);

# get the number of packages installed 
if($os eq "VoidLinux"){
my $package = qx(xbps-query -l | wc -l);
chomp($package);

print "\| OS: $os\n\| Kernel: $kernel\n\| $mem\n";
print "\| Uptime: $uptime\n\╰ Package Count: $package\n";
}
else{

print "\| OS: $os\n\| Kernel: $kernel\n\| $mem\n";
print "\╰ Uptime: $uptime\n";
}

1;
