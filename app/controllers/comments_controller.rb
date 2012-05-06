class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.issue, notice: 'Comment was successfully created.' }
        format.json { render json: @comment.issue, status: :created, location: @comment }
      else
        format.html { redirect_to @coment.issue }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.issue, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @comment.issue }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @issue = @comment.issue
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @issue }
      format.json { head :no_content }
    end
  end
end
