class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @kat = Cat.find_by(id: params[:id])
        render :show
    end

    def new
        @kat = Cat.new
        render :new
    end

    def create
        @kat = Cat.new(cat_params)
        if @kat.save
            redirect_to cat_url(@kat)
        else
            render :new 
        end
    end

    def edit
        @kat = Cat.find_by(id: params[:id])
        render :edit
    end


    def update
        @kat = Cat.find_by(id: params[:id])

        if @kat.update_attributes(cat_params)
            redirect_to cat_url(@kat)
        else
            render :edit
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :description, :birth_date, :color, :sex)
    end
end