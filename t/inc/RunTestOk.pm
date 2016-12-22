package RunTestOk;

use warnings;
use strict;

use Test::More;

use base 'Test::Builder::Module';

use Exporter 'import';

use feature qw/switch/;
no if $] >= 5.017011, warnings => 'experimental::smartmatch';
use Scalar::Util qw/reftype blessed/;

our @EXPORT = qw/ run_test_ok  /;

our %EXPORT_TAGS = ( all => [qw/run_test_ok/] );

my $tb = __PACKAGE__->builder;

=head1 run_test_ok
    
    my $args = {
        build => {
             class => 'Moonshine::Element', 
             args => {
                tag => 'p',
                text => 'hello'
             }
        }
        instructions => [
           { 
                action => 'render'
                args => {

                } 
                expected => '<p>hello</p>'
           },
           {
               action => 'text',
               expected => 'hello',
           },
        ],
    }

=cut

sub run_test_ok {
    my $args = shift;

    my $instructions = $args->{instructions};
    
    my $class;
    unless ( $class = $args->{class} ) {
        my $build = $args->{build};
        $class = $build->{class}->new($build->{args} // {});
    }

    for my $instruction (@{ $instructions }) {

        my $action = $instruction->{action};
        my $expected = $instruction->{expected};

        $action && $expected or diag explain $instruction and
            die 'I just burnt a hole in my home computer';

        my $test = defined $instruction->{args} 
            ? $class->$action($instruction->{args}) 
            : $class->$action;
        
        if (my $blessed = blessed $test) {
            $tb->is_eq($blessed, $expected, "$action returns Blessed - $expected");
            
            if (my $subtests = $instruction->{sub_tests}){
                diag 'Build new args for sub_tests';
                my $new_args = {
                    class => $test,
                    instructions => $subtests,
                };
                run_test_ok($new_args);
                diag 'Return to reality';
            }
        } else {
           given ( reftype \$test ) {
                when (/REF/) {
                    $tb->is_deeply($test, $expected, "$action IS DEEPLY - ");
                    diag explain $test;
                }
                when (/SCALAR/) {
                    $tb->is_eq($test, $expected, "$action IS SCALAR - $expected" );
                }
                default {
                  die diag explain $test;
                }
            }
        }
    }
}
