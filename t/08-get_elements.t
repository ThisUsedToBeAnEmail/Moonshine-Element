use Moonshine::Test qw/:all/;
use Moonshine::Element;

my $element = Moonshine::Element->new(
    {
        tag => 'div',
        children => [
            {
                tag => 'p',
                id => 'findme',
                data => [ 'Hey', 'You' ],
            }
        ] 
    }
);

moon_test(
    name => 'get_element_by_id - first child - easy - ' . kirby,
    instance => $element,
    instructions => [
        {
            test => 'render',
            expected => '<div><p id="findme">Hey You</p></div>',
        },
        {
            test => 'ref_index_obj',
            index => 0,
            func => 'get_elements',
            args => [ 'findme', ['id'] ],
            args_list => 1,
            expected => 'Moonshine::Element',
        }
    ]
);

my $elements = $element->get_elements('findme', ['id']);
render_me(
    instance => $elements->[0],
    expected => '<p id="findme">Hey You</p>',
);

sunrise();
