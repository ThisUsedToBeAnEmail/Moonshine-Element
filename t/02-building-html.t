#! perl

use Test::More;

use lib 't/testing';

use Dreams qw/:all/;

BEGIN {
    use_ok('Moonshine::Element');
}

subtest 'testing de basics' => sub {
    ok(1);
    moon_test({
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
            },
            {
                action => 'text',
                expected => 'hello',
            }
        ]
    });
};

subtest 'object' => sub {
    ok(1);
    my $child = Moonshine::Element->new({ tag => 'p', data => ['test'] });
    moon_test({
        build => {
            class => 'Moonshine::Element',
            args => {
                tag => 'div',
            }
        },
        instructions => [
            {
                action => 'add_child',
                args => $child,
                expected => 'Moonshine::Element',
                sub_tests => [
                    {
                        action => 'add_after_element',
                        args => $child,
                        expected => 'Moonshine::Element',
                    },
                    {
                        action => 'add_before_element',
                        args => $child,
                        expected => 'Moonshine::Element',
                    }
                ]
            },
            {
                action => 'render',
                expected => '<div><p>test</p><p>test</p><p>test</p></div>'
            }
        ],
    });
};

subtest 'basic_html_page' => sub {
    ok(1);
    moon_test({
        build => {
            class => 'Moonshine::Element',
            args => {
                tag => 'html',
            }
        },
        instructions => [
            {
                action => 'add_child',
                args => {
                    tag => 'head',
                },
                expected => 'Moonshine::Element',
                sub_tests => [
                    {
                        action => 'render', 
                        expected => '<head></head>',
                    },
                    {
                        action => 'add_child',
                        args => {
                            tag => 'title',
                            data => ['Page Title'],
                        },
                        expected => 'Moonshine::Element',
                        sub_tests => [
                            {
                                action => 'render',
                                expected => '<title>Page Title</title>',
                            }
                        ],
                    },
                    {
                        action => 'render',
                        expected => '<head><title>Page Title</title></head>',
                    }
                ]
            },
            {
                action => 'add_child',
                args => {
                    tag => 'body',
                },
                expected => 'Moonshine::Element',
                sub_tests => [
                    {
                        action => 'add_child',
                        args => {
                            tag => 'h1',
                            id => 'page-header',
                            class => 'big',
                            data=> ['Title'],
                        },
                        expected => 'Moonshine::Element',
                        sub_tests => [
                            {
                                action => 'add_after_element',
                                args => {
                                    tag => 'p',
                                    data => ['Add some content here'],
                                },
                                expected => 'Moonshine::Element',
                                sub_tests => [
                                    {
                                        action => 'render',
                                        expected => '<p>Add some content here</p>'
                                    }
                                ],
                            },
                        ],
                    },
                ],
            },
            {
                action => 'render',
                expected => '<html><head><title>Page Title</title></head><body><h1 class="big" id="page-header">Title</h1><p>Add some content here</p></body></html>',
            }
        ],
    });

};


done_testing();

1;
