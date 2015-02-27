class LabelsController < ApplicationController

  def index
    @labels = Label.fetch()
  end

  def create
    Label.create(params.select {|k,v| Label::PARAM.include? k})
    redirect_to labels_path, :notice => "Label has been created successfully!"
  end
end
