dep 'gitconfig' do
  requires 'email.gitconfig'
  requires 'name.gitconfig'
end

dep 'email.gitconfig' do
  key 'user.email'
  value 'scott@quadhome.com'
end

dep 'name.gitconfig' do
  key 'user.name'
  value 'Scott Robinson'
end
