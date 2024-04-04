# Author: Nate Dolny
# Last modified: April 3, 2024
#
#!/usr/bin/env perl

use strict;
use warnings;

# get the host 
my $os = qx(lsb_release -i -s);
chomp($os);

# get the kernel version 
my $kernel = qx(uname -r);
chomp($kernel);

# get the amount of memory 
my $mem = qx(free -hL | awk '{print \$5 \$6, \$7, \$8}');
chomp($mem);

# get the number of packages installed 
my $package = qx(xbps-query -l | wc -l);
chomp($package);

print "OS: $os\nKernel: $kernel\nMem: $mem\nPackage Count: $package\n";



1;
