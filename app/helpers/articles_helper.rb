require 'rdiscount'

module ArticlesHelper
  
  def html_transform(text)
    RDiscount.new(text.to_s).to_html.html_safe
  end

  def format_date(time)
    time.strftime("%B %d %Y")
  end

  def format_time(time)
    time.strftime("%I:%m%p")
  end

  def link_to_archive(archive_year)
    link_to archive_year.to_s, news_articles_archive_url(:year => archive_year )
  end

  def link_to_article(article, options = {})
    link_to h(article.title), article_url(article), options
  end
  
  def article_url(article)
    news_article_url :permalink => article.slug, :year => article.date.year
  end

  def url_escape(string)
    string.gsub(/([^ a-zA-Z0-9_.-]+)/n) do
      '%' + $1.unpack('H2' * $1.size).join('%').upcase
    end.tr(' ', '+')
  end
  
end

