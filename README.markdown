= Spree Product News

Adds simple news to Spree, which may be product related.
Reading text files in /content/article, which consist of yaml metadata followed by Markdown content.

There is a way to specify a product for the news item, which will be rendered next to the article.

You can create a skeleton new article with rake spree_product_news:new

Install
=======

1. The gem relies only on the prawn gem, to install you need to add the following lines to your Gemfile

    gem 'spree_product_news' , :git => 'git://github.com/dancinglightning/spree-product-news.git'

2. run bundler

    bundle install
  
3.  Install the stylesheet and it's less equivalent for you to edit

  rake spree_product_news:install 


Archives and xml feed included. Very basic layout.