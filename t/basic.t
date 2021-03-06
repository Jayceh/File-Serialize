use strict;
use warnings;

use Test::More; 
use Test::Exception;
use Test::Requires;

use Path::Tiny;
use File::Serialize;

for my $serializer ( File::Serialize->_all_serializers ) {
    subtest $serializer => sub {

        plan skip_all => "dependencies for $serializer not met" 
            unless $serializer->is_operative;


        my $ext = $serializer->extension;
        my $x = deserialize_file( "t/corpus/foo.$ext" );

        is_deeply $x => { foo => 'bar' };

        my $time = scalar localtime;

        my $path = "t/corpus/time.$ext";
        serialize_file( $path => {time => $time} );

        is deserialize_file($path)->{time} => $time;
    }
}

throws_ok {
    serialize_file 't/corpus/meh' => [ 1..5 ];
} qr/no serializer found/, 'no serializer found';

subtest "explicit format" => sub {
    test_requires 'YAML';

    serialize_file 't/corpus/mystery' => [1..5], { format => 'yaml' };

    like path('t/corpus/mystery')->slurp_utf8 => qr'- 1', 'right format';
};

done_testing;
