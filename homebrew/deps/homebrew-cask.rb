dep 'homebrew-cask' do
  requires 'homebrew'

  meet { shell 'brew install caskroom/cask/brew-cask' }
  met? { shell? 'brew cask' }
end

dep 'homebrew up to date' do
  requires 'homebrew'

  meet {
    shell 'brew upgrade'
    shell 'brew cleanup'
  }
  met? { `brew outdated`.strip.empty? }
end
