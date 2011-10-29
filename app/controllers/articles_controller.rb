class ArticlesController < Spree::BaseController
  rescue_from  Errno::ENOENT, :with => :render_404
  
  def index
    @articles = Article.all
    @article = @articles.pop
    @articles = @articles.reverse!
    set_extra
    respond_to do |wants|
      wants.html {}
      wants.xml {}
    end
  end
  
  def archive
    @articles = Article.all( )
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
        puts "Adding Product #{prods ? prods.name : 'No product'}  FOR #{name}"  
      end
    end
    if @article.image
      @image = @article.image
    end
  end
  
end
