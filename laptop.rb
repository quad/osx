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
  requires 'alfred cask integration'

  requires 'sporkd:osx computer name set'.with computer_name: 'rabi', local_hostname: 'rabi'

  requires 'vim'
end
