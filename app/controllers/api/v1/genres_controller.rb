module Api
  module V1
    class GenresController < ApiController
      before_action :set_genre, only: %i[ show update destroy ]

      # GET /genres or /genres.json
      def index
        @genres = Genre.all
        respond_with @genres, view: :index
      end

      # GET /genres/1 or /genres/1.json
      def show
        if @genre
          respond_with @genre, view: :show
        else
          render json: @genre.errors
        end
      end

      # POST /genres or /genres.json
      def create
        @genre = Genre.new(genre_params)

        if @genre.save
          render json: @genre
        else
          render json: @genre.errors
        end
      end

      # PATCH/PUT /genres/1 or /genres/1.json
      def update
        if @genre.update(genre_params)
          render json: @genre
        else
          render json: @genre.errors
        end
      end

      # DELETE /genres/1 or /genres/1.json
      def destroy
        @genre.destroy!

        render json: {notice: "Genre successfully destroyed"}
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_genre
        @genre = Genre.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def genre_params
        params.require(:genre).permit(:name)
      end
    end
  end
end
