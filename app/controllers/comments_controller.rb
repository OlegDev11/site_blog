class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin",        #пользователь не сможет добавлять коментарии
  password: "111"                                    #пока незарегистрируется на сайте


    def create                                 #функционал для коментариев
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to post_path(@post)
    end

     def comment_params
      params.require(:comment).permit(:username, :body)
    end
end
