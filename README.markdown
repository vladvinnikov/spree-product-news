Spree Product News
==================

Adds simple news to Spree, which may be product related or have an image attached.

Reading text files in /content/article, which consist of yaml metadata followed by Markdown content.

With rake spree_product_news:new  you can get a scaffold article with timestamp and slug.

To specify one or several products for the article, add product_name: as a comma separated list. Each word(s) will be used for a product search and the first shown in a product box with image and description.
 
Alternatively, you can add image: to the article and the image (full path) will be displayed next to the article in it's seperate box (410 pixels wide)

We now polished the layout and there is it's own stylesheet included

Install
=======

1. The gem relies only on the prawn gem, to install you need to add the following lines to your Gemfile

    gem 'spree_product_news' , :git => 'git://github.com/dancinglightning/spree-product-news.git'

2. run bundler

    bundle install
  
3.  Install the stylesheet and it's less equivalent for you to edit

  rake spree_product_news:install 


Contributions welcome

Torsten



