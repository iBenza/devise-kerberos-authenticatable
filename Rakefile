require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')
task default: :spec

namespace 'vagrant' do
  descs = {
    status: 'Outputs status of the vagrant machine',
    up: 'Starts krb5 server on vagrant',
    halt: 'Stops krb5 server on vagrant'
  }

  descs.each do |key, value|
    desc value
    task key do
      sh "VAGRANT_CWD=#{File.expand_path('../spec/vagrant', __FILE__)} vagrant #{key}"
    end
  end
end

namespace 'rails_app' do
  load File.expand_path('../spec/rails_app/Rakefile', __FILE__)
end
