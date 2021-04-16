class CommentsController < ApplicationController    
    def create
        @user = User.find(params[:user_id])
        @comment = @user.comment.new(comment_params)
        @comment.commenter = @user.display_name
        @comment.comment_time = Time.new.localtime

        respond_to do |format|
            if @comment.save
                format.html {redirect_to home_index_path(uid: @comment.recipient_ID, desired_date:  @comment.comment_date.to_date.to_s), notice: 'Comment was successfully created.' }
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :commenter, :comment_date, :comment_time, :user_id, :recipient_ID)
    end
end
