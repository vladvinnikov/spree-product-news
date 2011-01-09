class ArticlesController < Spree::BaseController
  rescue_from  Errno::ENOENT, :with => :render_404
  
  def index
    @per_page = 10
    @current_page = (params[:page] || 1).to_i
    @total_pages = (Article.count / @per_page.to_f).ceil
    @articles = Article.find_articles(:page => @current_page)
    @article = @articles.pop
    set_extra
    respond_to do |wants|
      wants.html {}
      wants.xml {}
    end
  end
  
  def archive
    @articles = Article.find_articles(:year => params[:year] )
    render :action => 'index'
  end
  
  def tag
    @articles = Article.tagged(params[:tag])
    render :action => 'index'
  end
  
  def show
    key = "#{params[:year]}-*-#{params[:permalink]}"
    puts "key #{key}"
    @article = Article.find(key)
    set_extra
  end
  
  private
  
  def set_extra
    @products = []
    if @article.product_name
      parts = @article.product_name.split(',')
      parts.each do |name| 
        name.strip!
        prods = Product.where(["name LIKE ?", "%#{name}%"]).limit(1).first
        @products << prods if prods 
        #puts "Adding Product #{prods ? prods.name : 'No product'}  FOR #{name}"  
      end
    end
    if @article.image
      @image = @article.image
    end
  end
  
end
