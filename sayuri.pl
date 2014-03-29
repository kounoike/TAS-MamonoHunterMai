#!perl

use strict;
use warnings;

my $wtf = "sayuri.wtf";

open(F, "<", $wtf) or die "$wtf: $!\n";

my $header = "";
read F, $header, 0x400 or die "$wtf header: $!\n";

my ($sig, $total, $rr) = unpack("A4LL", $header);


print "total:$total, rr:$rr\n";

open(JS, ">", "sayuri_input.js") or die "sayuri_input.avs: $!";
print JS <<'EOH';
AVS.last = m;
EOH


my $dummy = "";
read F, $dummy, 8;
my $cnt = 0;
$total -= 1;

my $rr_x_base = 560;
my $rr_x_spc = 13;
my $rr_y = 460;
my $rr_font = '"Arial"';
my $rr_fontsize = 20;
my $rr_fadeframe = 5;
my $rr_textcolor =  "0xffffff";
my $rr_textcolor2 = "0x999999";
my $rr_halocolor =  "0x333333";

my $debug = 0;
if ( $debug ) {
	my $x = $rr_x_base + $rr_x_spc * 4;
	print JS qq| m = AVS.Subtitle(m, "A", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 5;
	print JS qq| m = AVS.Subtitle(m, "B", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 0;
	print JS qq| m = AVS.Subtitle(m, "<", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 1;
	print JS qq| m = AVS.Subtitle(m, "v", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 2;
	print JS qq| m = AVS.Subtitle(m, "^", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 3;
	print JS qq| m = AVS.Subtitle(m, ">", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;

	exit;
}




while ($cnt++ < $total){
	my $input="";
	read F, $input, 8;
	my @input = unpack("CCCCCCCC", $input);
	printf "$cnt: %02x %02x %02x %02x %02x %02x %02x %02x\n",@input;
	
	for my $key( @input ){
		my $ef = $cnt + $rr_fadeframe;
		if($key == 0x5a){ # z key
			my $x = $rr_x_base + $rr_x_spc * 4;
			print JS qq| m = AVS.Subtitle(m, "A", $x, $rr_y, $cnt, $cnt, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
			print JS qq| m = AVS.Subtitle(m, "A", $x, $rr_y, $cnt+1, $ef, $rr_font, $rr_fontsize, $rr_textcolor2, $rr_halocolor);\n|;
		}elsif($key == 0x58){ # x key
			my $x = $rr_x_base + $rr_x_spc * 5;
			print JS qq| m = AVS.Subtitle(m, "B", $x, $rr_y, $cnt, $cnt, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
			print JS qq| m = AVS.Subtitle(m, "B", $x, $rr_y, $cnt+1, $ef, $rr_font, $rr_fontsize, $rr_textcolor2, $rr_halocolor);\n|;
		}elsif($key == 0x25){ # Left key
			my $x = $rr_x_base + $rr_x_spc * 0;
			print JS qq| m = AVS.Subtitle(m, "<", $x, $rr_y, $cnt, $cnt, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
			print JS qq| m = AVS.Subtitle(m, "<", $x, $rr_y, $cnt+1, $ef, $rr_font, $rr_fontsize, $rr_textcolor2, $rr_halocolor);\n|;
		}elsif($key == 0x28){ # Down key
			my $x = $rr_x_base + $rr_x_spc * 1;
			print JS qq| m = AVS.Subtitle(m, "v", $x, $rr_y, $cnt, $cnt, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
			print JS qq| m = AVS.Subtitle(m, "v", $x, $rr_y, $cnt+1, $ef, $rr_font, $rr_fontsize, $rr_textcolor2, $rr_halocolor);\n|;
		}elsif($key == 0x26){ # Up key
			my $x = $rr_x_base + $rr_x_spc * 2;
			print JS qq| m = AVS.Subtitle(m, "^", $x, $rr_y, $cnt, $cnt, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
			print JS qq| m = AVS.Subtitle(m, "^", $x, $rr_y, $cnt+1, $ef, $rr_font, $rr_fontsize, $rr_textcolor2, $rr_halocolor);\n|;
		}elsif($key == 0x27){ # Right key
			my $x = $rr_x_base + $rr_x_spc * 3;
			print JS qq| m = AVS.Subtitle(m, ">", $x, $rr_y, $cnt, $cnt, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
			print JS qq| m = AVS.Subtitle(m, ">", $x, $rr_y, $cnt+1, $ef, $rr_font, $rr_fontsize, $rr_textcolor2, $rr_halocolor);\n|;
		}
	}
}
print JS "\n";
close JS;
close F;

