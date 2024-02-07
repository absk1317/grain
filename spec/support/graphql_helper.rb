# graphql rspec helper

# frozen_string_literal: true

module GraphqlHelper
  def controller
    @controller ||= GraphqlController.new.tap do |obj|
      obj.set_request! ActionDispatch::Request.new({})
    end
  end

  def execute_graphql(query, **kwargs)
    GrainSchema.execute(
      query,
      context: { controller: }.merge(kwargs)
    )
  end
end

RSpec.configure do |c|
  c.include GraphqlHelper, type: :graphql
end
