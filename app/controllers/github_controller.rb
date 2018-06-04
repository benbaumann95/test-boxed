require "net/https"
require "uri"

class GithubController < ApplicationController
  before_action :fetch_ghub_repos, only: [:show]

  def index
    @user
  end

  def show
  end

  def destroy
  end

  private

  def fetch_ghub_repos
    ghub_user = params[:user]

    if working_ghub_url?(ghub_user) && !ghub_user.blank?
      @user = Octokit.user ghub_user

      ghub_repos = @user.rels[:repos].get.data

      languages_array = []
      ghub_repos.each do |repo|
        languages_array.push(repo["language"])
      end
      @fav_language = languages_array.max_by { |i| languages_array.count(i) }
    end
  end


  def working_ghub_url?(ghub_user)
    uri = URI.parse("https://github.com/#{ghub_user}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)

    @status = res.code
    @status == "200" ? true : false
  end
end

# def working_request?(ghub_user)
# open("https://github.com/#{ghub_user}") do |g|
#   g.base_uri  #=> http://www.example.org
#   g.status #=> ["200", "OK"]
#   raise
# end
# end

  # def working_url?(ghub_user)
  #   ghub_url = "https://github.com/#{ghub_user}"
  #   ghub_url = URI.parse(ghub_url)
  #   Net::HTTP.start(ghub_url.host, ghub_url.port) do |http|
  #     http.head(ghub_url.request_uri).code == '200'

  #   end
  # rescue
  #   false
  # end


