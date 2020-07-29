module ApplicationHelper

def has_gravatar(user, options = { size: 157})

gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

size = options[:size]

gravatar_url = "http://1.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

image_tag(gravatar_url, alt: user.username, class: "rounded-circle")

end
end
