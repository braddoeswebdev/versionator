module ApplicationHelper

def twitterized_type(type)
  case type
    when :alert
      "warning"
    when :error
      "error"
    when :notice
      "info"
    when :success
      "success"
    else
      type.to_s
  end
end

def format(str)
	sanitize(BlueCloth.new(str).to_html)
end

end
