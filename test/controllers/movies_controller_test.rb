require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url, as: :json
    assert_response :success
  end

  test "should create movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { director: @movie.director, duration: @movie.duration, title: @movie.title, year: 1950 } }, as: :json
    end

    assert_response :created
  end

  test "should show movie" do
    get movie_url(@movie), as: :json
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { director: @movie.director, duration: @movie.duration, title: @movie.title, year: 1950 } }, as: :json
    assert_response :success
  end

  test "should destroy movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie), as: :json
    end

    assert_response :no_content
  end

  # CUSTOM TESTS

  # Should get searchAPI
  test "should get search_api" do
    get "#{movies_search_api_url}?title=Home%20Alone", as: :json
    assert_response :success
  end

  # Test searching by title
  test "should search movies by title" do
    get "#{movies_search_api_url}?title=Home%20Alone", as: :json
    assert_response :success

    body = JSON.parse(@response.body)
    assert_equal "True", body["Response"]
  end

  # Test with wrong title
  test "search returns error response when wrong title is sent" do
    get "#{movies_search_api_url}?title=moviethatdoesntexist..", as: :json
    assert_response :success

    body = JSON.parse(@response.body)
    # Response should be false when sending a wrong title
    assert_equal "False", body["Response"]
  end

  # Test movie picker function
  test "should get moviePicker" do
    get movies_movie_picker_url, as: :json
    assert_response :success
  end

  # TEST VALIDATION RULES

  test "is invalid without a title" do
    movie = Movie.new(year: 2000, duration: 120, director: "Some guy")
    assert_not movie.valid?
    assert_includes movie.errors[:title], "Title is required"
  end

  test "is invalid without a year" do
    movie = Movie.new(title: "Bad movie", duration: 120, director: "Ron Howard")
    assert_not movie.valid?
    assert_includes movie.errors[:year], "Year is required"
  end

  test "is invalid if year is not in range " do
    oldMovie = Movie.new(title: "Movie from when movies did not exist", year: 1560)
    assert_not oldMovie.valid?
    assert_includes oldMovie.errors[:year], "Year must be after 1900"

    futureMovie = Movie.new(title: "Movie from a future in which Skynet took over", year: 3966)
    assert_not futureMovie.valid?
    assert_includes futureMovie.errors[:year], "must be less than #{Time.current.year}"
  end

  test "is valid with correct attributes" do
    movie = Movie.new(title: "Some valid movie", year: 1992, duration: 120, director: "Steven Spielbergo")
    assert movie.valid?
  end
end
