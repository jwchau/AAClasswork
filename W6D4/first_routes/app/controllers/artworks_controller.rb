class ArtworksController < ApplicationController #use dependent: destroy

    def index
        # artworks = Artwork.where(artist_id: params[:user_id])
        shares = Artwork.joins(:artwork_shares)
        total = shares.where("#{params[:user_id]} = viewer_id OR #{params[:user_id]} = artist_id")
        
        if total.empty?
            render plain: "No Artworks"
        else
            render json: total
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            render json: artwork
        else
            render plain: "Could not find Artwork with id: #{params[:id]}"
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end


    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            if artwork.update(artwork_params)
                redirect_to "/artworks/#{artwork.id}"
            else
                render json: artwork.errors.full_messages, status: 422
            end
        else
            redirect_to "/artworks/#{params[:id]}"
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            artwork.destroy
            render json: artwork
        else
            redirect_to "/artworks/#{params[:id]}"
        end 
    end


    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
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
