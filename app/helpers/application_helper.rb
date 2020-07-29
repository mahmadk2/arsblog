module ApplicationHelper

def has_gravatar(user, options = { size: 80})

gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

size = options[:size]

gravatar_url = "http://1.gravatar.com/avatar/6ca195bd70574ed81950d61f1f5af501/#{gravatar_id}?s=#{size}"

image_tag(gravatar_url, alt: user.username, class: "img-circle")

end
end
