class FiguresController < ApplicationController
  get "/figures/new" do
   erb :'/figures/new'
  end
  post "/figures" do
    @figure=Figure.create(params[:figure][:name])
    @figure.title_ids << params[:figure][:title_ids][:id]
    @figure.save
   erb :'/figures/show'
  end
end
