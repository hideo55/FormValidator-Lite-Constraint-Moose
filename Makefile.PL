use inc::Module::Install;
name 'FormValidator-Lite-Constraint-Moose';
all_from 'lib/FormValidator/Lite/Constraint/Moose.pm';

requires 'FormValidator::Lite';
requires 'Any::Moose' => '0.18';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More' => '0.94';
test_requires 'Test::Fatal';
auto_set_repository;
auto_include;
WriteAll;
