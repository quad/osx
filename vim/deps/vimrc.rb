dep 'linked dotfile.vim' do
  requires 'up to date.repo'

  def abs_rc
    '~/.vimrc'.p
  end

  def rel_rc
    '~/.vim/vimrc'.p
  end

  met? { abs_rc.exists? && abs_rc.readlink == rel_rc }
  meet { shell "ln -s '#{rel_rc}' '#{abs_rc}'" }
end

dep 'up to date.repo' do
  source 'https://github.com/quad/vimrc'
  path '~/.vim'
end
