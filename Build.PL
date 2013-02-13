use strict;
use warnings FATAL => 'all';
use Module::Build;

Module::Build->new(
    name                 => 'FormValidator-Lite-Constraint-Moose',
    module_name          => 'FormValidator::Lite::Constraint::Moose',
    dist_author          => 'Hideaki Ohno<hide.o.j55@gmail.com>',
    license              => 'perl',
    recursive_test_files => 1,
    dynamic_config       => 0,
    build_requires       => {
        'Test::More'  => '0.98',
        'Test::Fatal' => 0,
    },
    configure_requires => { 'Module::Build' => '0.38' },
    requires           => {
        'perl'                => '5.008003',
        'FormValidator::Lite' => '0.10',
        'Moose'               => '0.94',
    },
    no_index => { 'directory' => [ 't', 'xt', 'inc', 'eg' ] },
    test_files => ( -d '.git' || $ENV{RELEASE_TESTING} ) ? [qw(t/ xt/)] : ['t/'],
    create_makefile_pl => 'small',
    create_readme      => 1,
    add_to_cleanup     => ['FormValidator-Lite-Constraint-Moose-*'],
    meta_merge         => {
        keywords  => [qw/Moose FormValidator::Lite/],
        resources => {
            repository => 'git://github.com/hideo55/p5-FormValidator-Lite-Constraint-Moose.git',
            bugtracker => 'https://github.com/hideo55/p5-FormValidator-Lite-Constraint-Moose/issues',
        },
    },
)->create_build_script;
