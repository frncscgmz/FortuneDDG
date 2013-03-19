package DDG::Goodie::Fortune;

use DDG::Goodie;
use Fortune;

triggers start => 'fortune';
primary_example_queries 'fortune';
name 'Fortune';
description 'get a random phrase from the original fortunes file';
code_url '';
category 'Words and Games';
attribution github => ['https://github.com/frncscgmz', 'frncscgmz'];

zci is_cached => 1;
zci answer_type => "fortune";

handle remainder => sub {
   my $ffile = share('fortunes');
   my $fortune_file = new Fortune($ffile);
   $fortune_file->read_header();
   my $output = $fortune_file->get_random_fortune();
   $output =~ s/\n//g;
   return $output;
};

1;
