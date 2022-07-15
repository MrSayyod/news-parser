module Api
  module V1
    class ArticlesController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        articles = Article.all
        render json: ArticleSerializer.new(articles).serialized_json
      end

      def create
        url = 'https://www.bbc.com'
        doc = ::OpenURI.open_uri(url)
        html_raw = doc.read
        parsed_page = Nokogiri::HTML(html_raw)
        list = parsed_page.css('div.media__content').css('a.media__link')
        list.each do |data|
          @article = Article.new
          @article.title = data.text
          url_link = data.attributes['href'].value
          @article.url = urlHelper(url_link)
          @article.save
        end
        render json: ArticleSerializer.new(@article).serialized_json
      end

      private

      def article_params
        params.require(:article).permit(:title, :url)
      end
    end
  end
end