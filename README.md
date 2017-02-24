# NAME

Moonshine::Element - Build some more html.

# VERSION

Version 0.08 

# DESCRIPTION

# SYNOPSIS

    use Moonshine::Element;

    my $base = Moonshine::Element->new( tag => 'div' );

    my $child = $base->add_child({ tag => 'p' });
    $child->add_before_element({ tag => 'span' });
    $child->add_after_element({ tag => 'span' });

    $base->render
    .......

OUTPUT: &lt;div>&lt;span>&lt;/span>&lt;p>&lt;/p>&lt;span>&lt;/span>&lt;/div>

# ATTRIBUTES

## Override/Set/Push

    $base->$attribute($p_tag);

## Get

    $base->$attribute;
    $base->{$attribute}

## Defined/Count/Keys

    $base->has_$attribute;

## Clear

    $base->clear_$attribute;

## Default attribute's

### tag

html tag

### data

Array, that holds the elements content, use text to join

### children

elements can have children

### after\_element

Used when the element doesn't have a parent.

### before\_element

Used when the element doesn't have a parent.

### attribute\_list

List containing all valid attributes for the element

### guid

Unique Identifier 

# SUBROUTINES

## add\_child

Accepts a Hash reference that is used to build a new Moonshine::Element
which is pushed into that elements children attribute.

    $base->add_child(
        {
            tag => 'div'
            ....
        }
    );

## add\_before\_element

Accepts a Hash reference that is used to build a new Moonshine::Element, if the current
element has a parent, we slice in the new element before the current. If no parent exists the new element
is pushed in the before\_element attribute.

    $base->add_before_element(
        {
            tag => 'div',
            ....
        }
    );

## add\_after\_element

Accepts a Hash reference that is used to build a new Moonshine::Element, if the current
element has a parent, we slice in the new element after the current. If no parent exists the new element
is pushed in the after\_element attribute.

    $base->add_after_element(
        {
            tag => 'div',
            ....
        }
    );

## render

Render the Element as html.

    $base->render;

All attributes set on an 'Element' will be rendered. There is currently no Attribute to Element
validation.

Html attributes can be HashRef's (keys sorted and values joined), ArrayRef's(joined), or just Scalars.

# AUTHOR

Robert Acock <ThisUsedToBeAnEmail@gmail.com>

# CONFIGURATION AND ENVIRONMENT

# INCOMPATIBILITIES

# LICENSE AND COPYRIGHT

Copyright 2016 Robert Acock.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

[http://www.perlfoundation.org/artistic\_license\_2\_0](http://www.perlfoundation.org/artistic_license_2_0)

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
