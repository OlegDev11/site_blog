class PostsController < ApplicationController
http_basic_authenticate_with name: "admin", #пользователь не сможет добавлять, удалять, редоктировать посты
password: "111", except: [:index, :show]    #кроме того, как просматривать их

  def index                             #создане главной страницы
     @post = Post.all                   #отображаем все посты наглавной странице
  end

  def new                               #создание нового поста
      @post = Post.new                  #обявляем переменную пост
  end

  def show                              #ищет данные в БД по id и отображает их в html файле
    @post = Post.find(params[:id])
  end

  def edit                              #метод для редоктирования постов,
    @post = Post.find(params[:id])      #поиск нужной статьи
  end

  def update                            #для обновления данных на стр. после редоктирования
    @post = Post.find(params[:id])
  if(@post.update(post_params))         #если обновляем пост то
    redirect_to @post                   #перенаправка пользователя на новую страницу с отредакт.данными, с помощью метода show
  else                                  #если нет
    render 'edit'                       #то остаёмся на странице для редоктирования
  end
end

   def destroy                          #для удаления постов
     @post = Post.find(params[:id])     #для нахождения поста который хочешь удалить
     @post.destroy                      #удаление поста
        redirect_to posts_path          #перенаправляем польз. на главную страницу
   end

  def create                             #создание и сохранение нового поста
    #render plain: params[:post].inspect            #Функция отладки для проверки данных
    @post = Post.new (post_params)                  #создаём новый пост в БД
  if(@post.save)                                    #сохраняем его в БД, если проверка прошла валидацию
    redirect_to @post                               #перенаправка пользователя на новую страницу, с помощью метода show
  else                                              #если не прошла валидацию то
    render 'new'                                    #станица обновляется
  end
end
    private def post_params
       params.require(:post).permit(:title, :body)  #указываем какие поля разрешены для создания
     end
end
