class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    @article = Article.find params[:article_id]
    @sections = @article.sections

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find(params[:id])
    @article = @section.article || Article.find(params[:article_id])

  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @article = Article.find(params[:article_id])
    @section = @article.sections.build
    @section.article = @article

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
    @article = @section.article || Article.find(params[:article_id])
    @section.article = @article
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])
    @section.position = 9999

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section.article, notice: 'Section was successfully created.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section.article, notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end


  def sort
    Section.all.each do |spec|
      if position = params[:sections].index(spec.id.to_s)
        spec.update_attribute(:position, position + 1) unless spec.position == position + 1
      end
    end
    render :nothing => true, :status => 200
  end
end
