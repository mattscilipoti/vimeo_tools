class OverviewController < ApplicationController
  before_action :require_login

  def index
    @vimeo_data = fetch_vimeo_data
  end

  private

  def fetch_vimeo_data
    return nil unless current_user.vimeo_access_token.present?

    data = {}

    begin
      user = VimeoRuby::User.get_user(access_token: current_user.vimeo_access_token)
      data[:name] = user.name
      data[:bio] = user.bio
      data[:profile_link] = user.profile_link
    rescue => e
      data[:error_user] = "Failed to fetch user data: #{e.message}"
    end

    begin
      videos = VimeoRuby::User.get_user(access_token: current_user.vimeo_access_token).uploaded_videos
      data[:videos_total] = videos.videos.count
    rescue => e
      data[:error_videos] = "Failed to fetch videos: #{e.message}"
    end

    begin
      uri = URI("https://api.vimeo.com/me/projects")
      request = Net::HTTP::Get.new(uri)
      request["Authorization"] = "Bearer #{current_user.vimeo_access_token}"

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      folders_response = JSON.parse(response.body)
      data[:folders] = folders_response["data"].map do |folder|
        {
          name: folder["name"],
          video_count: folder["metadata"]["connections"]["videos"]["total"]
        }
      end
    rescue => e
      data[:error_folders] = "Failed to fetch folders: #{e.message}"
    end

    data
  end
end
