use inc::Module::Install;
name 'FormValidator-Lite-Constraint-Moose';
all_from 'lib/FormValidator/Lite/Constraint/Moose.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
