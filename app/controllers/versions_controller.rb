class VersionsController < ApplicationController
  # GET /versions
  # GET /versions.json
  def index
    @article = Article.find params[:article_id]
    @section = Section.find params[:section_id]
    @versions = @section.versions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @versions }
    end
  end

  # GET /versions/new
  # GET /versions/new.json
  def new
    @article = Article.find params[:article_id]
    @section = Section.find params[:section_id]
    @version = @section.versions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @version }
    end
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.new(params[:version])
    @section = Section.find params[:section_id]
    @version.section = @section

    @version.user = current_user

    respond_to do |format|
      if @version.save
        format.html { redirect_to article_section_path(@section.article, @section), notice: 'Version was successfully created.' }
        format.json { render json: @version.section, status: :created, location: @version }
      else
        format.html { render action: "new" }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version = Version.find(params[:id])
    @section = @version.section
    @version.destroy

    respond_to do |format|
      format.html { redirect_to article_section_path(@section.article, @section) }
      format.json { head :no_content }
    end
  end

  def duplicate
    @article = Article.find params[:article_id]
    @section = Section.find params[:section_id]
    @original = Version.find params[:id]
    @version = Version.new
    @version.content = @original.content
    @version.section = @original.section
    render action: "new"
  end

  def promote
    @article = Article.find params[:article_id]
    @section = Section.find params[:section_id]
    @version = Version.find params[:id]

    @section.primary = @version
    @section.save
    redirect_to article_section_path(@article.id, @section.id), :notice => "Promoted version to primary."
  end
end
