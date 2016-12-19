# NAME

Moonshine::Element

# VERSION

Version 0.1 

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

## Class Attributes

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

List containing all valid attributes (could change per element)

### guid

Unique Identifier 

## HTML ATTRIBUTES

TODO actually apply some validation.

### accept

List of types the server accepts, typically a file type.

Valid Elements: form, input

### accept\_charset

List of supportsed charsets

Valid Elements: form

### accesskey

Defines a keyboard shortcut to activate or add focus to the element

Global

### action

The URI of a program that processes the information submitted via the form

Valid Elements: form

### align

Specifies the horizontal alignment of the element

Valid Elements: applet caption col colgroup hr iframe img table tbody td tfoot th thead tr

### alt

Alternative text in case an image can't be displayed

Valid Elements: applet area img input

### async

Indicates that the script should be executed asynchronously

Valid Elements: script

### autofocus

The element should be automatically focused after the page is loaded

Valid Elements: button input keygen select textarea

### autoplay

The audio or video should play as soon as possible

Valid Elements: audio video

### autosave

Previous values should persist dropdowns of selectable values across page loads.

Valid Elements: input

### bgcolor

Background color of the element, Note: This is a legacy attribute. Please use CSS background-color.

Valid Elements: body col colgroup marquee table tbody tfoot td th tr

### border

The Border width. Note: This is a legacy attribute. Please use the CSS border property instead.

Valid Elements: img object table

### buffered

Contains the time range of already buggered media

Valid Elements: audio video

### Challenge

A challenge string that is submitted along with the public key

Valid Elements: keygen

### charset

Declares the character encoding of the page or script

Valid Elements: meta script

### checked

Indicates whether the element should be checked on page load

Valid Elements: command input

### cite

Contains a URI which points to the source of the quote or change

Valid Elements: blockquote

### code

Specifies the URL of the applet's class file to be loaded and executed

Valid Elements: applet

### codebase

This attribute gives the absolute or relative URL of the directory where 
applets' .class files referenced by the code attribute are stored.

Valid Elements: applet

### color

This attribute sets the text color using either a named color or a color 
specified in the hexadecimal #RRGGBB format. Note: This is a legacy attribute. 
Please use the CSS color property instead.

Valid Elements: basefont font hr

### cols

Defines the number of columns in a textarea.

Valid Elements: textarea

### colspan

The colspan attribute defines the number of columns a cell should span.

Valid Elements: td, th

### content

A value associated with http-equiv or name depending on the context.

Valid Elements: meta

### contenteditable

Indicates whether the element's content is editable."

Valid Elements: 'Global attribute'

### contextmenu

Defines the ID of a &amp;lt;menu&amp;gt; element which will serve as the element's context menu.

Valid Elements: 'Global attribute'

### controls

Indicates whether the browser should show playback controls to the user.

Valid Elements: audio, video

### coords

A set of values specifying the coordinates of the hot-spot region.

Valid Elements: area

### datetime

Indicates the date and time associated with the element.

Valid Elements: del ins time

### default

Indicates that the track should be enabled unless the user's preferences indicate something different.

Valid Elements: track

### defer

Indicates that the script should be executed after the page has been parsed.

Valid Elements: script

### dir

Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)

Valid Elements: 'Global attribute'

### dirname

Valid Elements: input, textarea

### disabled

Indicates whether the user can interact with the element.

Valid Elements: button, command, fieldset, input, keygen, optgroup, option, select, textarea'

### download

Indicates that the hyperlink is to be used for downloading a resource.

Valid Elements: a, area

### draggable

Defines whether the element can be dragged.

Valid Elements: 'Global attribute'

### dropzone

Indicates that the element accept the dropping of content on it.

Valid Elements: 'Global attribute'

### enctype

Defines the content type of the form date when the method is POST.

Valid Elements: form

### for

Describes elements which belongs to this one.

Valid Elements: label, output

### form

Indicates the form that is the owner of the element.

Valid Elements: button, fieldset, input, keygen, label, meter, object, output, progress, select, textarea'

### formaction

Indicates the action of the element, overriding the action defined in the form'

Valid Elements: input, button

### headers

IDs of the th elements which applies to this element.

Valid Elements: td, th

### height

Specifies the height of elements listed here. For all other elements, 
use the CSS height property. Note: In some instances, such as div, 
this is a legacy attribute, in which case the CSS height property 
should be used instead.

Valid Elements: canvas, embed, iframe, img, input, object&gt, video

### hidden

Prevents rendering of given element, while keeping child elements, e.g. script elements, active.

Valid Elements: 'Global attribute'

### high

Indicates the lower bound of the upper range.

Valid Elements: meter

### href

The URL of a linked resource.

Valid Elements: a, area, base, link

### hreflang

Specifies the language of the linked resource.

Valid Elements: a, area, link

### http-equiv

Valid Elements: meta

### icon

Specifies a picture which represents the command.

Valid Elements: command

### id

Often used with CSS to style a specific element. The value of this attribute must be unique.

Valid Elements: 'Global attribute'

### integrity

Security Feature that allows browsers to verify what they fetch.A MDN Link

Valid Elements: link, script

### ismap

Indicates that the image is part of a server-side image map.

Valid Elements: img

### itemprop

Valid Elements: 'Global attribute'

### keytype

Specifies the type of key generated.

Valid Elements: 'keygen'

### kind

Specifies the kind of text track.

Valid Elements: track

### label

Specifies a user-readable title of the text track.

Valid Elements: track

### lang

Defines the language used in the element.

Valid Elements: 'Global attribute'

### language

Defines the script language used in the element.

Valid Elements: script

### list

Identifies a list of pre-defined options to suggest to the user.

Valid Elements: input

### loop

Indicates whether the media should start playing from the start when it's finished.

Valid Elements: audio, bgsound, marquee, video

### low

Indicates the upper bound of the lower range.

Valid Elements: meter

### manifest

Specifies the URL of the document's cache manifest.

Valid Elements: html

### max

Indicates the maximum value allowed.

Valid Elements: input, meter, progress

### maxlength

Defines the maximum number of characters allowed in the element.

Valid Elements: input, textarea

### media

Specifies a hint of the media for which the linked resource was designed.

Valid Elements: a, area, link, source, style

### method

Defines which HTTP method to use when submitting the form. Can be GET (default) or POST .

Valid Elements: form

### min

Indicates the minimum value allowed.

Valid Elements: input, meter

### multiple

Indicates whether multiple values can be entered in an input of the type email or file.

Valid Elements: input, select

### muted

Indicates whether the audio will be initially silenced on page load.

Valid Elements: video

### name

Name of the element. For example used by the server to identify the fields in form submits.

Valid Elements: button, form, fieldset, iframe, input, keygen, 
object, output, select, textarea, map, meta, param

### novalidate

This attribute indicates that the form shouldn't be validated when submitted.

Valid Elements: form

### open

Indicates whether the details will be shown on page load.

Valid Elements: details

### optimum

Indicates the optimal numeric value.

Valid Elements: meter

### pattern

Defines a regular expression which the element's value will be validated against.

Valid Elements: input

### ping

Valid Elements: a, area

### placeholder

Provides a hint to the user of what can be entered in the field.

Valid Elements: input, textarea

### poster

A URL indicating a poster frame to show until the user plays or seeks.

Valid Elements: video

### preload

Indicates whether the whole resource, parts of it or nothing should be preloaded.

Valid Elements: audio, video

### radiogroup

Valid Elements: command

### readonly

Indicates whether the element can be edited.

Valid Elements: input, textarea

### rel

Specifies the relationship of the target object to the link object.

Valid Elements: a, area, link

### required

Indicates whether this element is required to fill out or not.

Valid Elements: input, select, textarea

### reversed

Indicates whether the list should be displayed in a descending order 
instead of a ascending.

Valid Elements: ol

### rows

Defines the number of rows in a text area.

Valid Elements: 'textarea'

### rowspan

Defines the number of rows a table cell should span over.

Valid  Elements: td, th

### sandbox

Valid Elements: iframe

### scope

Valid Elements: th

### scoped

Valid Elements: style

### seamless

Valid Elements: iframe

### selected

Defines a value which will be selected on page load.

Valid Elements: option

### shape

Valid Elements: a, area

### size

Defines the width of the element (in pixels). If the element's type 
attribute is text or password then it's the number of characters.

Valid Elements: input, select

### sizes

Valid Elements: link, img, source

### span

Valid Elements: col, colgroup

### spellcheck

Indicates whether spell checking is allowed for the element.

Valid Elements: Global attribute

### src

The URL of the embeddable content.

Valid Elements: audio, embed, iframe, img, input, script, source, track, video

### srcdoc

Valid Elements: iframe

### srclang

Valid Elements: track

### srcset

Valid Elements: img

### start

Defines the first number if other than 1.

Valid Elements: ol

### step

Valid input

### style

Defines CSS styles which will override styles previously set.

Valid Elements: 'Global attribute'

### summary

Valid Elements: table

### tabindex

Overrides the browser's default tab order and follows the one specified instead.

Valid Elements: 'Global attribute'

### target

Valid Elements: a, area, base, form

### title

Text to be displayed in a tooltip when hovering over the element.

Valid Elements: 'Global attribute'

### type

Defines the type of the element.

Valid Elements: button, input, command, embed, object, script, source, style, menu

### usemap

Valid Elements: img, input, object

### value

Defines a default value which will be displayed in the element on page load.

Valid Elements: button, option, input, li, meter, progress, param

### width

For the elements listed here, this establishes the element's width. Note: For 
all other instances, such as &amp;lt;div&amp;gt; , this is a legacy attribute, in which 
case the CSS width a property should be used instead.

Valid Elements: canvas, embed, iframe, img, input, object, video'

### wrap

Indicates whether the text should be wrapped.

Valid Elements: textarea

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
