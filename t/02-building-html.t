#! perl
use Moonshine::Test qw/:all/;
use lib 't/testing';

use Moonshine::Element;

moon_test({
    name => 'test de basics',
    build => {
        class => 'Moonshine::Element',
        args => {
            tag => 'p',
            data => ['hello'],
        }
    },
    instructions => [
        {
            test => 'render',
            expected => '<p>hello</p>',
        },
        {
            test => 'scalar',
            func => 'text',
            expected => 'hello',
        },
        {
            test => 'obj',
            func => 'add_before_element',
            args => {
                tag => 'p',
                data => ['one'],
                class => 'two',
            },
            expected => 'Moonshine::Element',
            subtest => [
                 {
                    test => 'ref_key_scalar',
                    key => 'tag',
                    expected => 'p',
                 },
                 {
                    test => 'scalar',
                    func => 'text',
                    expected => 'one',
                 },
                 {
                    test => 'ref_key_scalar',
                    key => 'class',
                    expected => 'two',
                 },
                 {
                    test => 'render',
                    expected => '<p class="two">one</p>',
                 }
            ],
        },
        {
            test => 'render',
            expected => '<p class="two">one</p><p>hello</p>',
        },
        {
            func => 'add_after_element',
            args => {
                tag => 'p',
                data => ['four'],
                class => 'three',
            },
            expected => 'Moonshine::Element',
            subtest => [
                 {
                    test => 'ref_key_scalar',
                    key => 'tag',
                    expected => 'p',
                 },
                 {
                    test => 'scalar',
                    func => 'text',
                    expected => 'four',
                 },
                 {
                    test => 'ref_key_scalar',
                    key => 'class',
                    expected => 'three',
                 },
                 {
                    test => 'render',
                    expected => '<p class="three">four</p>',
                 }
            ],
        },
        {
            test => 'render',
            expected => '<p class="two">one</p><p>hello</p><p class="three">four</p>'
        },
        {
            test => 'scalar',
            func => 'text',
            expected => 'hello',
        }
    ]
});

my $child1 = Moonshine::Element->new({ tag => 'p', data => ['test'] });
my $child2 = Moonshine::Element->new({ tag => 'p', data => ['test'] });
my $child3 = Moonshine::Element->new({ tag => 'p', data => ['test'] });

moon_test({
    name => 'object',
    build => {
        class => 'Moonshine::Element',
        args => {
            tag => 'div',
        }
    },
    instructions => [
        {
            func => 'add_child',
            args => $child1,
            subtest => [
                {
                    test => 'obj',
                    func => 'add_after_element',
                    args => $child2,
                    expected => 'Moonshine::Element',
                },
                {
                    test => 'obj',
                    func => 'add_before_element',
                    args => $child3,
                    expected => 'Moonshine::Element',
                }
            ]
        },
        {
            test => 'render',
            expected => '<div><p>test</p><p>test</p><p>test</p></div>'
        }
    ],
});

moon_test({
    name => 'a complicated html page... :)',
    build => {
        class => 'Moonshine::Element',
        args => {
            tag => 'html',
        }
    },
    instructions => [
        {
            test => 'obj',
            func => 'add_child',
            args => {
                tag => 'head',
            },
            expected => 'Moonshine::Element',
            subtest => [
                {
                    test => 'render', 
                    expected => '<head></head>',
                },
                {
                    test => 'obj',
                    func => 'add_child',
                    args => {
                        tag => 'title',
                        data => ['Page Title'],
                    },
                    expected => 'Moonshine::Element',
                    subtest => [
                        {
                            test => 'render',
                            expected => '<title>Page Title</title>',
                        }
                    ],
                },
                {
                    test => 'render',
                    expected => '<head><title>Page Title</title></head>',
                }
            ]
        },
        {
            test => 'obj',
            func => 'add_child',
            args => {
                tag => 'body',
            },
            expected => 'Moonshine::Element',
            subtest => [
                {
                    test => 'obj',
                    func => 'add_child',
                    args => {
                        tag => 'h1',
                        id => 'page-header',
                        class => 'big',
                        data=> ['Title'],
                    },
                    expected => 'Moonshine::Element',
                    subtest => [
                        {
                            test => 'obj',
                            func => 'add_after_element',
                            args => {
                                tag => 'p',
                                data => ['Add some content here'],
                            },
                            expected => 'Moonshine::Element',
                            subtest => [
                                {
                                    test => 'render',
                                    expected => '<p>Add some content here</p>'
                                }
                            ],
                        },
                    ],
                },
            ],
        },
        {
            test => 'render',
            expected => '<html><head><title>Page Title</title></head><body><h1 class="big" id="page-header">Title</h1><p>Add some content here</p></body></html>',
        }
    ],
});

sunrise(32);

1;
