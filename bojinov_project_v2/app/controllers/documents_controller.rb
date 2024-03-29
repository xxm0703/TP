class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :create, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    
    if request.path == '/'
      @documents = Document.last(3).reverse
      return
    end

    if session[:user_id].nil?
      render plain: "You don't have permission for this page"
    else
      @documents = Document.all
    end
    
  end
  
  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        if params[:document][:photo]
          @document.create_photo(data: params[:document][:photo].read,
                                 filename: params[:document][:photo].original_filename,
                                 mime_type: params[:document][:photo].content_type)
        end
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        if params[:document][:photo]
          if @document.photo
            @document.photo.destroy
          end
          @document.create_photo(data: params[:document][:photo].read,
                                 filename: params[:document][:photo].original_filename,
                                 mime_type: params[:document][:photo].content_type)
        end
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    if @document.photo
      @document.photo.destroy
    end

    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :desc, :content)
    end
end
