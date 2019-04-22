
helpers do

  alias original_slim slim

  def slim(template, opts={})

    locals = (opts[:locals] ||= {})

    locals[:page] = pa = File.basename(request.path_info)

    { css: 'sheets', js: 'scripts' }
      .each do |suffix, dir|
        pas = "/#{dir}/#{pa}.#{suffix}"
        locals[:"page_#{suffix}"] = File.exist?("public#{pas}") ? pas : nil
      end

    original_slim(template, opts)
  end
end

