class CommentsController < ActionController::Base    
    def create
        @user = User.find(params[:user_id])
        @comment = @user.comment.new(comment_params)
        @comment.commenter = @user.display_name
        @comment.recipient_ID = @user.user_id

        respond_to do |format|
            if @comment.save
                format.html {redirect_to home_index_path(@user), notice: 'Comment was successfully created.' }
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :commenter, :recipient_ID)
    end
end
