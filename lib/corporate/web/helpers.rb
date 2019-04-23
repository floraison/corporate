
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

      #//script src="/scripts/handlebars.min-v4.0.5.js"
      #//script src="/scripts/h-1.1.2-76aeddb.min.js?ev=#{Sg.enversion}"
      #script src="/scripts/corporate.js"
    ss = %w[ /scripts/corporate.js ]

    pa = "/scripts/#{page_name}.js"
    ss << pa if File.exist?("public#{pa}")

    ss
  end
end

