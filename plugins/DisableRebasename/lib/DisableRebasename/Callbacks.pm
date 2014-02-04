package DisableRebasename::Callbacks;
use strict;
use warnings;

sub template_source_edit_entry {
    my ($cb, $app, $tmpl) = @_;

    my $old = <<'HERE';
    jQuery('input#title').mtRebasename({
        edit: '<__trans phrase="Edit">',
        limit: '<$mt:var name="basename_limit" escape="js"$>',
        basename: '<$mt:var name="basename" escape="js"$>'
    });
HERE
    $old = quotemeta($old);
    my $new = <<'HERE';
    jQuery('input#title').mtRebasename({
        edit: '<__trans phrase="Edit">',
        limit: '<$mt:var name="basename_limit" escape="js"$>',
        basename: '<$mt:var name="basename" escape="js"$>'
    });
    jQuery('input#basename').mtEditInput({edit: '<__trans phrase="Edit">'});
HERE
    $$tmpl =~ s/$old/$new/;
}

1;
