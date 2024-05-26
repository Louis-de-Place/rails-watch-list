class TvSeriesController < ApplicationController
  def index
    @tv_series_lists = TvSerie.all.group_by(&:list_type)
  end

  def list
    @list_type = params[:list_type]
    @tv_series = TvSerie.where(list_type: @list_type)
  end

  def show
    @tv_serie = TvSerie.find(params[:id])
  end
end
