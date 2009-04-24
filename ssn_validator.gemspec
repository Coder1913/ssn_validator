# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ssn_validator}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kevin Tyll"]
  s.date = %q{2009-04-24}
  s.description = %q{Validates whether an SSN has likely been issued or not.}
  s.email = %q{kevintyll@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "History.txt",
    "LICENSE",
    "PostInstall.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "generators/death_master_file_migration/death_master_file_migration_generator.rb",
    "generators/death_master_file_migration/templates/migration.rb",
    "generators/ssn_validator_migration/ssn_validator_migration_generator.rb",
    "generators/ssn_validator_migration/templates/migration.rb",
    "lib/ssn_validator.rb",
    "lib/ssn_validator/models/death_master_file.rb",
    "lib/ssn_validator/models/death_master_file_loader.rb",
    "lib/ssn_validator/models/ssn_high_group_code.rb",
    "lib/ssn_validator/models/ssn_high_group_code_loader.rb",
    "lib/ssn_validator/models/ssn_validator.rb",
    "lib/ssn_validator/ntis.rb",
    "lib/tasks/ssn_validator.rake",
    "test/files/test_dmf_funky_data_load.txt",
    "test/files/test_dmf_initial_load.txt",
    "test/files/test_dmf_update_load.txt",
    "test/files/valid_csv_from_funky_data_file.txt",
    "test/mocks/test/death_master_file_loader.rb",
    "test/test_death_master_file_loader.rb",
    "test/test_helper.rb",
    "test/test_ssn_high_group_code_loader.rb",
    "test/test_ssn_validator.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://kevintyll.git.com/ssn_validator}
  s.post_install_message = %q{
For more information on ssn_validator, see http://kevintyll.github.com/ssn_validator/

* To create the necessary db migration, from the command line, run:
    script/generate ssn_validator_migration
* Require the gem in your environment.rb file in the Rails::Initializer block:
    config.gem 'kevintyll-ssn_validator', :lib => 'ssn_validator'
* To load your table with the current SSN data, from the command line, run:
    rake ssn_validator:update_data
    * The SSN data is updated monthly, so you'll want to run this rake task monthly to keep your validations accurate.
* If you've purchased the death master file data, create the death_master_files migration:
    script/generate death_master_file_migration
* To load the dmf files you receive from ntis:
    rake ssn_validator:death_master_file:load_file PATH='path/to/file' AS_OF='2009-03-01'
    * You'll need to pass in the full path to where the file is on disk.  You'll also need
      to pass in the date this file's data are as of in the format yyyy-mm-dd.
    * This task must be used to load the initial file you receive from ntis on CD.  It can optionally be used
      to load the monthly update files you download from the website.  If you manually download the update files,
      you do not need to add your user name and password to the environment.rb file.  For a more automated approach
      to loading the update files, add your user name and password to the environment.rb file and use the 2nd rake task.
* To load the monthly updates from the ntis website:
    * Add your user_name and password to the environment.rb file
        SsnValidator::Ntis.user_name = 'REPLACE WITH YOUR dmf.ntis.gov USER NAME'
        SsnValidator::Ntis.password = 'REPLACE WITH YOUR dmf.ntis.gov PASSWORD'
    * Run the rake task:
        rake ssn_validator:death_master_file:update_data
        * This rake task will determine the most recent file that has been loaded, and loads all subsequent files in order
        from the dmf.ntis.gov website.
        * The death master file data is updated monthly, so you'll want to run this rake task monthly to keep your validations accurate.
}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Validates whether an SSN has likely been issued or not.}
  s.test_files = [
    "test/mocks/test/death_master_file_loader.rb",
    "test/test_death_master_file_loader.rb",
    "test/test_helper.rb",
    "test/test_ssn_high_group_code_loader.rb",
    "test/test_ssn_validator.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end