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

subtest 'object' => sub {
    ok(1);
    moon_test({
        build => {
            class => 'Moonshine::Element',
            args => {
                tag => 'div',
                data => '0',
                aria_valuemin => '0',
            }
        },
        instructions => [
            {
                action => 'render',
                expected => '<div aria-valuemin="0">0</div>'
            },
        ],
    });
};

subtest 'object' => sub {
    ok(1);
    moon_test({
        build => {
            class => 'Moonshine::Element',
            args => {
                tag => 'div',
            }
        },
        instructions => [
            {
                action => 'render',
                expected => '<div></div>'
            },
            {
                action => 'set',
                args => {
                    data => '0',
                    aria_valuemin => '0'   
                },
                expected => 'Moonshine::Element',
            },
            {
                action => 'render',
                expected => '<div aria-valuemin="0">0</div>'
            },
        ],
    });
};

done_testing();

1;
