Rails.application.routes.draw do
root 'posts#index', as: 'home'                #root этот метод вызывает главную страничку, добавляем as 'home'

get 'about' => 'pages#about', as: 'about'     #get метод других страниц нашего сайта, добав. as: 'about'

resources :posts do                           #resource метод для отслежывания URL адресов
  resources :comments                         #для отслеживания URL адресов в нутри других URL адресов
  end
end
