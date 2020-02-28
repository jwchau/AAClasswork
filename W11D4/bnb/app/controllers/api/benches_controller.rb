class Api::BenchesController < ApplicationController

    def index
        @benches = Bench.all
        render :index
    end

    def create
        @bench = Bench.new(bench_params)
        if @bench.save
            render 'api/benches/bench'
        else
            render json: ["invalid bench"], status: 422
        end
    end

    private
    def bench_params
        params.require(:bench).permit(:description, :lat, :lng)
    end
end
