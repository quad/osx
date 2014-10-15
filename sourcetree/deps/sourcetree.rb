dep 'sourcetree' do
  requires 'sourcetree license.copy'
end

dep 'sourcetree license.copy' do
  requires 'sourcetree.cask'

  source 'sourcetree.license'
  target '~/Library/Application Support/SourceTree/sourcetree.license'
end
