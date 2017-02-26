#! perl
use Moonshine::Test qw/:all/;

use Moonshine::Element;

my $cite = Moonshine::Element->new( { tag => 'code', data => '&lt;section&gt;' } );

moon_test(
    name => 'chain name',
    build => {
        class => 'Moonshine::Element',
        args  => {
            tag      => 'div',
            name     => 'one',
            children => [
                {
                    tag      => 'div',
                    name     => 'two',
                    children => [
                        {
                            tag  => 'div',
                            name => 'three',
                        }
                    ]
                }
            ]
        }
    },
    instructions => [
        {
            test => 'render',
            expected => '<div name="one"><div name="two"><div name="three"></div></div></div>',
        },
    ],
);

sunrise(2);

1;
