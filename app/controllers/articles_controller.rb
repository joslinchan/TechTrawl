class ArticlesController < ApplicationController
 
    def index
       
        newsapi = News.new("7cc1435c50a14ace808ab284ec562f9c")

        @top_headlines = newsapi.get_top_headlines(
            q: 'startup'
            
        )

        #    render json: @top_headlines
    end

       
end
