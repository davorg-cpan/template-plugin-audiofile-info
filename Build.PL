use Module::Build;
my $build = new Module::Build(module_name => 'Template::Plugin::AudioFile::Info',
			      license => 'perl',
			      requires => {
					   perl            => '5.6.0',
                                           Template        => 0,
                                           AudioFile::Info => 0,
					  },
                              create_makefile_pl => 'passthrough'
			     );
$build->create_build_script;
