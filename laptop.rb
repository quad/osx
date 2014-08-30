dep 'laptop' do
  BREWS.each { |c| requires "#{c}.managed" }
  CASKS.each { |c| requires "#{c}.cask" }
  requires 'alfred cask integration'

  requires 'sporkd:osx computer name set'.with computer_name: 'rabi', local_hostname: 'rabi'
end

BREWS=%w{
  ack
}

CASKS=%w{
  airfoil
  alfred
  box-sync
  caffeine
  google-chrome
  iterm2
  macvim
  onepassword
  skype
  slack
  sourcetree
  spectacle
  the-unarchiver
  vagrant
  virtualbox
}

BREWS.each do |cask|
  dep "#{cask}.managed"
end

CASKS.each do |cask|
  dep "#{cask}.cask"
end
