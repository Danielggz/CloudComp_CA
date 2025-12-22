class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show update destroy ]

  # GET /movies
  def index
    @movies = Movie.all

    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # Search movies from title
  def search_api
    title = params[:title]
    year = params[:year]

    if title.blank?
      return render json: { error: "Missing title parameter" }, status: :bad_request
    end

    result = MovieFunctions.search_api(title, year)
    render json: result
  end

  # Get movie to watch from the watchlist
  def moviePicker
    result = MovieFunctions.picker()
    render json: result
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_content
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.expect(movie: [ :title, :year, :director, :duration ])
    end
end
