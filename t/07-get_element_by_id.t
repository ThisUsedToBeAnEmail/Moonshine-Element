use Moonshine::Test qw/:all/;
use Moonshine::Element;

moon_test(
    name => 'get_element_by_id - first child - easy - ' . kirby,
    build => {
        class => 'Moonshine::Element',
        args => {
            tag => 'div',
            children => [
                {
                    tag => 'p',
                    id => 'findme',
                    data => [ 'Hey', 'You' ],
                }
            ] 
        }
    },
    instructions => [
        {
            test => 'render',
            expected => '<div><p id="findme">Hey You</p></div>',
        },
        {
            test => 'obj',
            func => 'get_element_by_id',
            args => [ 'findme' ],
            args_list => 1,
            expected => 'Moonshine::Element',
            subtest => [
                {
                    test => 'render',
                    expected => '<p id="findme">Hey You</p>',
                }
            ]
        }
    ]
);

moon_test(
    name => 'get_element_by_id - after_element - - ' . strut,
    build => {
        class => 'Moonshine::Element',
        args => {
            tag => 'div',
            children => [
                {
                    tag => 'p',
                    data => [ 'Twice' ],
                }
            ],
            after_element => [
                {
                    tag => 'p',
                    id => 'findme',
                    data => [ 'Why', 'are', 'you', 'here' ],
                }
            ], 
        }
    },
    instructions => [
        {
            test => 'render',
            expected => '<div><p>Twice</p></div><p id="findme">Why are you here</p>',
        },
        {
            test => 'obj',
            func => 'get_element_by_id',
            args => ['findme'],
            args_list => 1,
            expected => 'Moonshine::Element',
            subtest => [
                {
                    test => 'render',
                    expected => '<p id="findme">Why are you here</p>',
                }
            ]
        }
    ]
);


sunrise();
