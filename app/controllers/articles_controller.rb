class ArticlesController < ApplicationController
    include HTTParty

    def index
        newsapi = News.new("7cc1435c50a14ace808ab284ec562f9c")

        @top_headlines = newsapi.get_top_headlines(
            q: 'startup'
        )

        @top_headlines.each do |article|
            @article = Article.new(
                title: article.title,
                source: article.name,
                description: article.description,
                url_to_image: article.urlToImage,
                published_at: article.publishedAt,
                url: article.url,
                company_id: Company.all.sample.id
            )

        if @article.save
        end

        end
    end
end