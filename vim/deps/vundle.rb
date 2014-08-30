dep 'vundle plugins up to date.vim' do
  requires 'vundle up to date.repo'

  met? { shell? 'vim +PluginInstall +PluginClean +qall 2&> /dev/null' }
end

dep 'vundle up to date.repo' do
  source 'https://github.com/gmarik/Vundle.vim'
  path '~/.vim/bundle/Vundle.vim'
end
