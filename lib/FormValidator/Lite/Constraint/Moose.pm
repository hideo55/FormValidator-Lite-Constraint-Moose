package FormValidator::Lite::Constraint::Moose;
use strict;
use warnings;
use FormValidator::Lite::Constraint;
use Any::Moose ( '::Util::TypeConstraints' => [] );

our $VERSION = '0.01';

*_get_constraint = any_moose('::Util::TypeConstraints')->can('find_type_constraint');

my @types = any_moose('::Util::TypeConstraints')->list_all_type_constraints();
for my $name (@types) {
    rule $name => sub {
        _get_constraint($name)->check($_);
    };
}

1;
__END__

=head1 NAME

FormValidator::Lite::Constraint::Moose -

=head1 SYNOPSIS

  use FormValidator::Lite::Constraint::Moose;

=head1 DESCRIPTION

FormValidator::Lite::Constraint::Moose is

=head1 AUTHOR

Hideaki Ohno E<lt>hide.o.j55 {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
