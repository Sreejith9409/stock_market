class UsersController < ApplicationController
  def portfolio
    render_success_response({
      document: single_serializer.new(current_user, serializer: PortfolioSerializer)
    })
  end

end
