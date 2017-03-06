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

my $element_comp = Moonshine::Element->new(
    {
        tag => 'div',
        after_element => [
            {
                tag => 'p',
                id => 'hiding',
                data => [ 'One', 'Two' ],
                children => [
                    {
                        tag => 'span',
                        class => { 1 => 'found' },
                        data => [ 'If', 'You', 'Can' ],
                    },
                ]
            },
        ],
        children => [
            {
                tag => 'p',
                id => 'findme',
                class => [ 'found' ],
                data => [ 'Catch', 'Me' ],
            }
        ],
        before_element => [
            {
                tag => 'p',
                id => 'hiding',
                data => [ 'One', 'Two' ],
                children => [
                    {
                        tag => 'span',
                        class => 'okay found',
                        data => [ 'Hey', 'You' ],
                    },
                ]
             },             
        ], 
    }
);

moon_test(
    name => 'get_element_by_id - first child - easy - ' . kirby,
    instance => $element_comp,
    instructions => [
        {
            test => 'render',
            expected => '<p id="hiding">One Two<span class="okay found">Hey You</span></p><div><p class="found" id="findme">Catch Me</p></div><p id="hiding">One Two<span class="found">If You Can</span></p>',
        },

        {
            test => 'count_ref',
            index => 0,
            func => 'get_elements',
            args => [ 'found', ['class'] ],
            args_list => 1,
            expected => 3,
        }
    ]
);

my $findme = $element_comp->get_elements('findme', ['id']);
render_me(
    instance => $findme->[0],
    expected => '<p class="found" id="findme">Catch Me</p>',
);

my $found = $element_comp->get_elements('found', ['class']);
render_me(
    instance => $found->[0],
    expected => '<span class="okay found">Hey You</span>',
);

render_me(
    instance => $found->[1],
    expected => '<p class="found" id="findme">Catch Me</p>',
);

render_me(
    instance => $found->[2],
    expected => '<span class="found">If You Can</span>',
);

sunrise();
