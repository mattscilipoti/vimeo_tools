class OverviewController < ApplicationController
  before_action :require_login

  def index
    @vimeo_data = fetch_vimeo_data
  end

  private

  def fetch_vimeo_data
    return nil unless current_user.vimeo_access_token.present?

    begin
      user = VimeoRuby::User.get_user(access_token: current_user.vimeo_access_token)
      videos = user.uploaded_videos
      {
        name: user.name,
        bio: user.bio,
        videos_total: videos.videos.count,
        profile_link: user.profile_link
      }
    rescue => e
      { error: "Failed to fetch Vimeo data: #{e.message}" }
    end
  end
end
