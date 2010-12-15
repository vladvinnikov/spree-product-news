Rails.application.routes.draw do

  match '/news',                              :to => 'articles#index',   :as => 'news_articles'
  match '/news.:format',                      :to => 'articles#index',   :as => 'news_articles'
  match '/news/tag/:tag',                     :to => 'articles#tag',     :as => 'news_tag'
  match '/news/page/:page',                   :to => 'articles#index',   :as => 'news_articles_page'
  match '/news/:year',                        :to => 'articles#archive', :as => 'news_articles_archive'
  match '/news/:year/:month/:day/:permalink', :to => 'articles#show',    :as => 'news_article'

end
