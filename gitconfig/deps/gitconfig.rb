dep 'gitconfig' do
  requires 'email.gitconfig'
  requires 'name.gitconfig'
end

dep 'email.gitconfig' do
  key 'user.email'
  value 'sr@thoughtworks.com'
end

dep 'name.gitconfig' do
  key 'user.name'
  value 'sr@thoughtworks.com'
end
