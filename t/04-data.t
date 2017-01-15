#! perl

use Test::More;

use lib 't/testing';

use Dreams qw/:all/;

BEGIN {
    use_ok('Moonshine::Element');
}

subtest 'object' => sub {
    ok(1);
    my $cite =
      Moonshine::Element->new( { tag => 'code', data => '&lt;section&gt;' } );
    moon_test(
        {
            build => {
                class => 'Moonshine::Element',
                args  => {
                    tag  => 'div',
                    data => [ 'hello', $cite, 'should be wrapped as inline' ],
                }
            },
            instructions => [
                {
                    action => 'render',
                    expected =>
'<div>hello <code>&lt;section&gt;</code> should be wrapped as inline</div>'
                },
            ],
        }
    );

    moon_test(
        {
            build => {
                class => 'Moonshine::Element',
                args  => {
                    tag  => 'div',
                    data => [ 'hello', { tag => 'code', data => '&lt;section&gt' }, 'should be wrapped as inline' ],
                }
            },
            instructions => [
                {
                    action => 'render',
                    expected =>
'<div>hello <code>&lt;section&gt;</code> should be wrapped as inline</div>'
                },
            ],
        }
    );


};

done_testing();

1;
