class VisitorsController < ApplicationController
  def index
    (task = Task.create).do_later
  end
end
