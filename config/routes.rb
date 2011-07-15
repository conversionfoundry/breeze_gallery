Rails.application.routes.draw do
  scope "admin/galleries", :module => "breeze/gallery", :name_prefix => "admin_gallery" do
    root :to => "galleries#index"

    resources :galleries do
      resources :images
    end
  end
end