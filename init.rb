Breeze.configure do
  Breeze::Content.register_class Breeze::Gallery::Instance
end

Breeze.hook :admin_menu do |menu, user|
  menu << { :name => "Galleries", :path => "/admin/galleries" } if user.can? :manage, Breeze::Content::Item
end

Breeze.hook :content_template_paths do |paths|
  paths << "../../../breeze_gallery/app/views/breeze/gallery/templates/gallery"
end
