class ArticlesController < Spree::BaseController
  rescue_from  Errno::ENOENT, :with => :render_404
  
  def index
    @per_page = 10
    @current_page = (params[:page] || 1).to_i
    @total_pages = (Article.count / @per_page.to_f).ceil
    @articles = Article.find_articles(:page => @current_page)
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
    @article = Article.find(key)
  end
  
end
