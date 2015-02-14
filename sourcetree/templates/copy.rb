require 'digest/sha2'

meta :copy do
  accepts_value_for :source
  accepts_value_for :target

  template {
    def source_path
      dependency.load_path.parent / source
    end

    def target_path
      target / source
    end

    met? {
      target_path.exists? && (Digest::SHA512.file(source_path) == Digest::SHA512.file(target_path))
    }
    meet {
      target.p.mkdir
      source_path.copy target_path
    }
  }
end
