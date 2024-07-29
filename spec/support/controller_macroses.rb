# frozen_string_literal: true

module ControllerMacros
  # def self.included(base)
  #   base.extend(ClassMetods)
  # end

  # module ClassMetods
  #   def it_render_404_page_when_post_is_not_found(*actions)
  #     actions.each do |a|
  #       it "#{a} renders 404 pages when post is not found" do
  #         verb = if a == :update
  #           "PATH"
  #         elsif a == :destroy
  #           "DELETE"
  #         else
  #           "GET"
  #         end
  #         process a, verb, {id: 0}
  #         response.status.should == 404
  #       end
  #     end
  #   end
  # end
end
