class FiguresController < ApplicationController
  get "/figures" do
    @figures=Figure.all
    erb :'/figures/index'
  end
  get "/figures/new" do
   erb :'figures/new'
  end
  get "/figures/:id" do
    @figure=Figure.find_by_id(params[:id])
    erb :'figures/show'
  end
  get "/figures/:id/edit" do
    @figure=Figure.find(params[:id])
    erb :'figures/edit'
  end
  post "/figures" do
    @figure=Figure.create(params[:figure])
    if params[:title][:name] != ""
       @figure.titles << Title.create(params[:title])
    end

    if params[:landmark][:name] != ""
       @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect to '/figures'
  end

  post "/figures/:id" do
    @figure=Figure.find_by_id(params[:id])
    @figure.update(params[:figure])#@figure.name=params[:figure][:name]
    if params[:landmark][:name] != ""
    	@figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
