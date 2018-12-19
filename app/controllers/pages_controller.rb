class PagesController < ApplicationController
    def about
        @heading = 'Страничка про нас! И это круто'
        @text = 'Немного тектса'
    end
end
