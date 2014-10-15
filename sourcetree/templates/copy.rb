require 'digest/sha2'

meta :copy do
  accepts_value_for :source
  accepts_value_for :target

  template {
    def source_path
      dependency.load_path.parent / source
    end

    met? {
      target.p.exists? && (Digest::SHA512.file(source_path) == Digest::SHA512.file(target.p.abs))
    }
    meet { source_path.copy target.p.dir }
  }
end
