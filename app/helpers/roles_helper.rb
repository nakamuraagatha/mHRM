module RolesHelper
  def l_or_humanize(s, options={})
    k = "#{options[:prefix]}#{s}".to_sym
    ::I18n.t(k, :default => s.to_s.humanize)
  end

end
