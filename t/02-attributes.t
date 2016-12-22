#! perl

use Test::More;

use lib 't/inc';

use RunTestOk qw/:all/;

BEGIN {
    use_ok('Moonshine::Element');
}

subtest 'testing de basics' => sub {
    ok(1);
    run_test_ok({
        build => {
            class => 'Moonshine::Element',
            args => {
                tag => 'p',
                data => ['hello'],
            }
        },
        instructions => [
            {
                action => 'render',
                expected => '<p>hello</p>',
            },
            {
                action => 'text',
                expected => 'hello',
            },
            {
                action => 'add_before_element',
                args => {
                    tag => 'p',
                    data => ['one'],
                    class => 'two',
                },
                expected => 'Moonshine::Element',
                sub_tests => [
                     {
                        action => 'tag',
                        expected => 'p',
                     },
                     {
                        action => 'text',
                        expected => 'one',
                     },
                     {
                        action => 'class',
                        expected => 'two',
                     },
                     {
                        action => 'render',
                        expected => '<p class="two">one</p>',
                     }
                ],
            },
            {
                action => 'render',
                expected => '<p class="two">one</p><p>hello</p>',
            },
            {
                action => 'add_after_element',
                args => {
                    tag => 'p',
                    data => ['four'],
                    class => 'three',
                },
                expected => 'Moonshine::Element',
                sub_tests => [
                     {
                        action => 'tag',
                        expected => 'p',
                     },
                     {
                        action => 'text',
                        expected => 'four',
                     },
                     {
                        action => 'class',
                        expected => 'three',
                     },
                     {
                        action => 'render',
                        expected => '<p class="three">four</p>',
                     }
                ],
            },
            {
                action => 'render',
                expected => '<p class="two">one</p><p>hello</p><p class="three">four</p>'
            }
        ]
    });
};


done_testing();

1;
