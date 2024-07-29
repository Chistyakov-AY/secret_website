# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      # span class: "blank_slate" do
      #   span I18n.t("active_admin.dashboard_welcome.welcome")
      #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    columns do
      column do
        panel 'Все посты:' do
          ul do
            Post.all.order(updated_at: :desc).map do |post|
              li link_to(post.title, post_path(post), target: :blank)

              post.comments.map do |comment|
                ol comment.body
              end
            end
          end
        end
      end

      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
  end
end
