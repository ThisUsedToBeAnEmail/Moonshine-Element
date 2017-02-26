#! perl
use Moonshine::Test qw/:all/;

use Moonshine::Element;

my $cite =
  Moonshine::Element->new( { tag => 'code', data => '&lt;section&gt;' } );

moon_test(
    name  => 'chain name',
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
            expected =>
'<div name="one"><div name="two"><div name="three"></div></div></div>',
        },
        {
            test     => 'obj',
            func     => 'two',
            expected => 'Moonshine::Element',
            subtest  => [
                {
                    test => 'render',
                    expected =>
                      '<div name="two"><div name="three"></div></div>',
                },
                {
                    test     => 'obj',
                    func     => 'three',
                    expected => 'Moonshine::Element',
                    subtest  => [
                        {
                            test     => 'render',
                            expected => '<div name="three"></div>',
                        }
                    ]
                }
            ]
        },
        {
            test     => 'obj',
            func     => 'three',
            expected => 'Moonshine::Element',
            subtest  => [
                {
                    test     => 'render',
                    expected => '<div name="three"></div>',
                }
            ]
        }
    ],
);

moon_test(
    name  => 'chain name',
    build => {
        class => 'Moonshine::Element',
        args  => {
            tag            => 'div',
            name           => 'one',
            before_element => [
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
            expected =>
'<div name="two"><div name="three"></div></div><div name="one"></div>',
        },
        {
            test     => 'obj',
            func     => 'two',
            expected => 'Moonshine::Element',
            subtest  => [
                {
                    test => 'render',
                    expected =>
                      '<div name="two"><div name="three"></div></div>',
                },
                {
                    test     => 'obj',
                    func     => 'three',
                    expected => 'Moonshine::Element',
                    subtest  => [
                        {
                            test     => 'render',
                            expected => '<div name="three"></div>',
                        }
                    ]
                }
            ]
        },
        {
            test     => 'obj',
            func     => 'three',
            expected => 'Moonshine::Element',
            subtest  => [
                {
                    test     => 'render',
                    expected => '<div name="three"></div>',
                }
            ]
        }
    ],
);

moon_test(
    name  => 'chain name',
    build => {
        class => 'Moonshine::Element',
        args  => {
            tag           => 'div',
            name          => 'one',
            after_element => [
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
            expected =>
'<div name="one"></div><div name="two"><div name="three"></div></div>',
        },
        {
            test     => 'obj',
            func     => 'two',
            expected => 'Moonshine::Element',
            subtest  => [
                {
                    test => 'render',
                    expected =>
                      '<div name="two"><div name="three"></div></div>',
                },
                {
                    test     => 'obj',
                    func     => 'three',
                    expected => 'Moonshine::Element',
                    subtest  => [
                        {
                            test     => 'render',
                            expected => '<div name="three"></div>',
                        }
                    ]
                }
            ]
        },
        {
            test     => 'obj',
            func     => 'three',
            expected => 'Moonshine::Element',
            subtest  => [
                {
                    test     => 'render',
                    expected => '<div name="three"></div>',
                }
            ]
        }
    ],
);

sunrise(33);

1;
