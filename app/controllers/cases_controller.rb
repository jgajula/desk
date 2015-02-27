class CasesController < ApplicationController
  def update
    Case.update(params[:id], params.select{|k,v| k == "labels"})
    render :nothing => true
  end
end