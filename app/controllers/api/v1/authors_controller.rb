module Api
  module V1
    class AuthorsController < ApiController
      before_action :set_author, only: %i[ show update destroy ]

      # GET /authors or /authors.json
      def index
        @authors = Author.all
        respond_with @authors
      end

      # GET /authors/1 or /authors/1.json
      def show
        if @author
          respond_with @author
        else
          render json: @author.errors
        end
      end

      # POST /authors or /authors.json
      def create
        @author = Author.new(author_params)

        if @author.save
          render json: @author
        else
          render json: @author.errors
        end
      end

      # PATCH/PUT /authors/1 or /authors/1.json
      def update
        if @author.update(author_params)
          render json: @author
        else
          render json: @author.errors
        end
      end

      # DELETE /authors/1 or /authors/1.json
      def destroy
        @author.destroy!

        render json: {notice: "Author successfully destroyed"}
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:first_name, :last_name)
      end
    end
  end
end
