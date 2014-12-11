class VisitorsController < ApplicationController
  def index
    Task.new(42).do_later
  end
end
