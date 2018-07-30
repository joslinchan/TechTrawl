class ArticlesController < ApplicationController
    include HTTParty

    def index
        @articles = Article
            .order(published_at: :asc)
            .paginate(:per_page => 10, :page => params[:page])

        newsapi = News.new("7cc1435c50a14ace808ab284ec562f9c")

        news = newsapi.get_everything(
            q: 'tech, business, programming',
            from: '2018-07-01',
            to: '2018-07-30',
            language: 'en',
            sortBy: 'relevancy',
            page: 2)

        news.each do |article|
            article = Article.new(
                title: article.title,
                source: article.name,
                description: article.description,
                url_to_image: article.urlToImage,
                published_at: article.publishedAt,
                url: article.url,
                company_id: Company.all.sample.id
            )

        if article.save
        end
    end
    end
end
