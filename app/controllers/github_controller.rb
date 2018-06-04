class GithubController < ApplicationController
  before_action :fetch_ghub_repos, only: [:show, :destroy]

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
    @user = Octokit.user ghub_user
    ghub_repos = @user.rels[:repos].get.data

    languages_array = []
    ghub_repos.each do |repo|
      languages_array.push(repo["language"])

      @fav_language = languages_array.max_by { |i| languages_array.count(i) }
    end
  end
end
