guard 'livereload' do
  watch %r"assets/(stylesheets|javascripts)/.+" do |match|
    match[0].gsub(/scss/, 'css').gsub(/coffee/, 'js')
  end

  watch %r"views/.+"
  watch %r"web\.rb"
end
