class FiltersController < ApplicationController

  def index
    @filters = Filter.fetch()
    @labels = Label.fetch()

    unless @filters.blank?
      session[:filter_id] ||= @filters.first.id
      @cases = Case.fetch(session[:filter_id])
    end
  end


  def show
    @cases = Case.fetch(params[:id])
    @labels = Label.fetch()
    session[:filter_id] = params[:id]
  end
end