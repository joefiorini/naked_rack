require 'hpricot'

class NakedRack

  DEFAULT_OPTIONS = { :display_banner => true, :remove_js => false, :permanent => false }

  def initialize(app, options={})
    @app = app
    @options = options.reverse_merge(DEFAULT_OPTIONS)
  end

  def call(env)
    return @app.call(env) unless today_is_naked_css_day? or @options[:permanent]
    status, headers, response = @app.call(env)
    body = ''
    response.each do |str|
      body = remove_link_tags(str).to_html
      body = remove_style_tags(body).to_html
      body = remove_js_tags(body).to_html if @options[:remove_js]
    end
    headers['Content-Length'] = body.length.to_s
    [status, headers, body]
  end

private

  def remove_link_tags body
    remove_tags body, "//link[@rel='stylesheet']"
  end

  def remove_style_tags body
    remove_tags body, "style"
  end

  def remove_js_tags body
    remove_tags body, "script"
  end

  def remove_tags body, search_str
    h_doc = Hpricot(body)
    elems = h_doc.search(search_str)
    if @options[:display_banner]
      replace_with_banner! elems
    else
      elems.remove
    end
    h_doc
  end

  def today_is_naked_css_day?
    Date.today.month == 4 and Date.today.day == 9
  end

  def replace_with_banner! h_elems
    h_elems.each { |elem| elem.swap("<!-- Happy CSS Naked Day! Brought to you by naked_rack and Joe Fiorini -->") }
  end

end
