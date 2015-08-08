parse = -> (l) {
  n, p = l.strip.split(':')
  [n, -> (t) { dep "#{n}.#{t}" do provides p if p end }]
}
brews = File.readlines(File.expand_path '../brews.lst', __FILE__).map &parse
casks = File.readlines(File.expand_path '../casks.lst', __FILE__).map &parse
brews.each { |n, p| p['managed'] }
casks.each { |n, p| p['cask'] }

dep 'laptop' do
  brews.each { |n, p| requires "#{n}.managed" }
  casks.each { |n, p| requires "#{n}.cask" }

  requires 'sporkd:osx computer name set'.with computer_name: 'nathalia', local_hostname: 'nathalia'

  requires 'gitconfig'
  requires 'vim'
  requires 'sourcetree'
  requires 'hidden dock'

  requires 'ssh private key'
  requires 'ssh passphrase in keychain'
end

dep 'hidden dock' do
  met? { `defaults read com.apple.dock autohide`.strip == "1" }
  meet {
    shell 'defaults write com.apple.dock autohide -boolean true'
    shell 'killall -u `whoami` Dock'
  }
end

dep 'ssh private key' do
  def keyfile
    '~/.ssh/id_rsa'.p
  end

  met? { keyfile.exists? }
  meet {
    require 'securerandom'
    puts "Here's a passphrase: #{SecureRandom.hex}"
    shell "ssh-keygen -f #{keyfile}"
  }
end

dep 'ssh passphrase in keychain' do
  def keyfile
    '~/.ssh/id_rsa'.p
  end

  met? { shell? "security find-generic-password -s SSH -a #{keyfile}" }
  meet { shell "ssh-add -K #{keyfile}" }
end
