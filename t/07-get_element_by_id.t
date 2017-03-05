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

sunrise();
