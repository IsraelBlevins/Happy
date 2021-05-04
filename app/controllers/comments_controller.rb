class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ destroy ]

    def new
        @member = Member.find(params[:member_id])
        @comment = @member.comment.new(parent_id: params[:parent_id], comment_date: params[:comment_date], recipient_ID: params[:recipient_ID], commenter: params[:commenter])
    end

    def create
        @member = Member.find(params[:member_id])
        @comment = @member.comment.new(comment_params)
        @comment.commenter = @member.display_name
        @comment.comment_time = Time.new.localtime

        respond_to do |format|
            if @comment.save
                format.html {redirect_to home_index_path(uid: @comment.recipient_ID, desired_date:  @comment.comment_date.to_date.to_s), notice: 'Comment was successfully created.' }
            end
        end
    end

    def destroy
        @redirectID = @comment.recipient_ID
        @redirectDate = @comment.comment_date.to_date.to_s
        @comment.destroy
        redirect_to home_index_path(uid: @redirectID, desired_date:  @redirectDate)
    end

    private

    def set_comment
       @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body, :commenter, :comment_date, :comment_time, :member_id, :recipient_ID, :parent_id)
    end
end
