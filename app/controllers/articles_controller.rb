class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :home, :sociedade, :esporte, :entretenimento, :saude, :tecnologia]
  before_filter :disable_container, only: [:home]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def upreview
    @article = Article.find(params[:id])
    @article.reviews.create(user: current_user)
    redirect_to(:back, notice: 'Seu voto foi computado com sucesso! Não se esqueça que apenas é permitido um voto por artigo, se você gostou muito do artigo e quer que ele tenha mais votos compartilhe ele em seu Facebook!')
  end

  def home
    @articles = Article.all
    @i = [0,1,2,3,4,5,6,7]
  end


  def sociedade
    @articles = Article.all
  end

  def esporte
    @articles = Article.all
  end

  def entretenimento
    @articles = Article.all
  end

  def saude
    @articles = Article.all
  end

  def tecnologia
    @articles = Article.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_path, notice: "Não autorizado à editar este artigo" if @article.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :category_id, :image)
    end
end
