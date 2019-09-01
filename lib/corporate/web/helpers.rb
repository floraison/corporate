
helpers do

  def user_name

    session[:user][:name]
  end

  def page_name

    File.basename(request.path_info)
  end

  def sheets

    ss = %w[ /sheets/reset.css /sheets/icofont.min.css /sheets/corporate.css ]

    pa = "/sheets/#{page_name}.css"
    ss << pa if File.exist?("public#{pa}")

    ss
  end

  def scripts

    ss = %w[ /scripts/corporate.js ]

    pa = "/scripts/#{page_name}.js"
    ss << pa if File.exist?("public#{pa}")

    ss
  end

  def present(page)

    slim(page, {}, context(page))
      # page, options, locals, &body
  end

  def context(page)

    { alpha: 'hello' }
  end
end

