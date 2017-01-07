#! perl

use Test::More;

use lib 't/testing';

use Dreams qw/:all/;

BEGIN {
    use_ok('Moonshine::Element');
}

subtest 'object' => sub {
    ok(1);
    moon_test({
        build => {
            class => 'Moonshine::Element',
            args => {
                tag => 'div',
                data => 'hello'
            }
        },
        instructions => [
            {
                action => 'render',
                expected => '<div>hello</div>'
            },
            {
                action => 'set',
                args => {
                    tag => 'p',
                    class => 'new'   
                },
                expected => 'Moonshine::Element',
            },
            {
                action => 'render',
                expected => '<p class="new">hello</p>'
            }
        ],
    });
};

done_testing();

1;
