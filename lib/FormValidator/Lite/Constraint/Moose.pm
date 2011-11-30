package FormValidator::Lite::Constraint::Moose;
use strict;
use warnings;
use FormValidator::Lite::Constraint;
use Any::Moose ( '::Util::TypeConstraints' => [] );

our $VERSION = '0.03';

*_get_constraint = any_moose('::Util::TypeConstraints')->can('find_type_constraint');

my @types = any_moose('::Util::TypeConstraints')->list_all_type_constraints();
for my $name (@types) {
    my $constraint = _get_constraint($name);
    rule $name => sub {
        $constraint->check($_);
    };
}

1;
__END__

=head1 NAME

FormValidator::Lite::Constraint::Moose - Use Moose's type constraints.

=head1 SYNOPSIS

  use FormValidator::Lite;
  FormValidator::Lite->load_constraints(qw/Moose/);

  my $validator = FormValidator::Lite->new(CGI->new("flg=1"));
  $validator->check(
     flg => ['Bool']
 );

  #if you wanna use your original constraints.
  use FormValidator::Lite;
  use Any::Moose '::Util::TypeConstraints';

  enum 'HttpMethod' => qw(GET HEAD POST PUT DELETE); #you must load before load 'FormValidator::Lite->load_constraints(qw/Moose/)'

  FormValidator::Lite->load_constraints(qw/Moose/);

  my $validator = FormValidator::Lite->new(CGI->new("req_type=GET"));
  $validator->check(
     "req_type => ['HttpMethod']
 );


=head1 DESCRIPTION

This module provides Mo[o|u]se's type constraint as constraint rule of L<FormValidator::Lite>
If you wanna know the constraint, see L<Moose::Util::TypeConstraints> for details.

=head1 AUTHOR

Hideaki Ohno E<lt>hide.o.j55 {at} gmail.comE<gt>

=head1 SEE ALSO

L<FormValidator::Lite>,L<Moose::Util::TypeConstraints>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
