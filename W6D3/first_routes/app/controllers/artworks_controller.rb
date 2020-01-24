class ArtworksController < ApplicationController #use dependent: destroy
    def index
        artworks = Artworks.all 
        render json: artworks
    end
end



















    # def index
    #     artworks = Artwork.all
    #     render json: artworks
    # end

    # def show
    #     artwork = Artwork.find_by(id: params[:id])
    #     render json: artwork
    # end

    # def create
    #     artwork = Artwork.new(artwork_params)
    #     if artwork.save
    #         redirect_to "/artworks/#{artwork.id}"
    #     else
    #         render json: artwork.errors.full_messages, status: :unprocessable_entity
    #     end
    
    # end

    # def update
    #     artwork = Artwork.find_by(id: params[:id])

    #     if artwork.update(artwork)
    #         render json: artwork
    #     else
    #         render json: artwork.errors.full_messages, status: 422
    #     end

    # end

    # def destroy
    #     artwork = Artwork.find_by(id: params[:id])
    #     artwork.destroy
    #     render json: artwork
    # end

    # private
    # def artwork_params
    #     params.require(:artwork).permit(:title, :image_url, :artist_id)
    # end
