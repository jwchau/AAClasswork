class ArtworkSharesController < ApplicationController

    def create
        art_share = ArtworkShare.new(artwork_shares_params)
        if art_share.save
            render json: art_share
        else
            render json: art_share.errors.full_messages, status: 422
        end
    end

    def destroy
        art_share = ArtworkShare.find(params[:id])
        if art_share
            art_share.destroy
            render json: art_share
        else
            render plain: "Can't find Artwork Share with id: #{params[:id]}"
        end
    end

    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
