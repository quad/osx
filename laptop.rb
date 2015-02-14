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

  requires 'sporkd:osx computer name set'.with computer_name: 'rabi', local_hostname: 'rabi'

  requires 'vim'
  requires 'sourcetree'
  requires 'hidden dock'
end

dep 'hidden dock' do
  met? { `defaults read com.apple.dock autohide`.strip == "1" }
  meet {
    shell 'defaults write com.apple.dock autohide -boolean true'
    shell 'killall -u `whoami` Dock'
  }
end
