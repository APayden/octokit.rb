require 'octokit/connection'
require 'octokit/configurable'
require 'octokit/warnable'
require 'octokit/enterprise_admin_client/admin_stats'
require 'octokit/enterprise_admin_client/license'
require 'octokit/enterprise_admin_client/search_indexing'

module Octokit

  # EnterpriseAdminClient is only meant to be used by GitHub Enterprise Admins
  # and provides access the Admin only API endpoints including Admin Stats,
  # Management Console, and the Search Indexing API.
  #
  # @see Octokit::Client Use Octokit::Client for regular API use for GitHub
  #   and GitHub Enterprise.
  # @see https://developer.github.com/v3/enterprise/
  class EnterpriseAdminClient

    include Octokit::Configurable
    include Octokit::Connection
    include Octokit::Warnable
    include Octokit::EnterpriseAdminClient::AdminStats
    include Octokit::EnterpriseAdminClient::License
    include Octokit::EnterpriseAdminClient::SearchIndexing

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Octokit::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Octokit.instance_variable_get(:"@#{key}"))
      end
    end

  end
end
