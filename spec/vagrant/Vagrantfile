Vagrant.configure(2) do |config|
  USERS = [
    ['dog', 'bowwow'],
    ['cat', 'mewmew'],
  ].join(' ').freeze

  config.vm.box = "tiagomartins/krb5"
  config.vm.network :forwarded_port, guest: 88, host: 10088, auto_correct: true

  config.vm.provision :shell, :path => 'initialize_krb5.sh', args: USERS
end
