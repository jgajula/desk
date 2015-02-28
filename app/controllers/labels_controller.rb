class LabelsController < ApplicationController

  def index
    @labels = Label.fetch()
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @labels }
    end
  end

  def create
    Label.create(params.select {|k,v| Label::PARAM.include? k})
    redirect_to labels_path, :notice => "Label has been created successfully!"
  end
end
