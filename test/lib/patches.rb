class String
  if not method_defined?(:force_encoding)
    def force_encoding(enc)
      self
    end
  end
end
