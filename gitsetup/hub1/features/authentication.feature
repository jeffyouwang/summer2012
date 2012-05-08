Feature: OAuth authentication
  Background:
    Given I am in "dotfiles" git repo

  Scenario: Ask for username & password, create authorization
    Given the GitHub API server:
      """
      require 'rack/auth/basic'
      get('/authorizations') { '[]' }
      post('/authorizations') {
        auth = Rack::Auth::Basic::Request.new(env)
        halt 401 unless auth.credentials == %w[mislav kitty]
        halt 400 unless params[:scopes] == ['repo']
        body :token => 'OTOKEN'
      }
      post('/user/repos') { status 200 }
      """
    When I run `hub create` interactively
    When I type "mislav"
    And I type "kitty"
    Then the output should contain "github.com username:"
    And the output should contain "github.com password for mislav (never stored):"
    And the exit status should be 0
    And the file "../home/.config/hub" should contain "oauth_token: OTOKEN"

  Scenario: Ask for username & password, re-use existing authorization
    Given the GitHub API server:
      """
      require 'rack/auth/basic'
      get('/authorizations') {
        auth = Rack::Auth::Basic::Request.new(env)
        halt 401 unless auth.credentials == %w[mislav kitty]
        body [
          {:token => 'SKIPPD', :app => {:url => 'http://example.com'}},
          {:token => 'OTOKEN', :app => {:url => 'http://defunkt.io/hub/'}}
        ]
      }
      post('/user/repos') { status 200 }
      """
    When I run `hub create` interactively
    When I type "mislav"
    And I type "kitty"
    Then the output should contain "github.com password for mislav (never stored):"
    And the exit status should be 0
    And the file "../home/.config/hub" should contain "oauth_token: OTOKEN"

  Scenario: Wrong password
    Given the GitHub API server:
      """
      require 'rack/auth/basic'
      get('/authorizations') {
        auth = Rack::Auth::Basic::Request.new(env)
        halt 401 unless auth.credentials == %w[mislav kitty]
      }
      """
    When I run `hub create` interactively
    When I type "mislav"
    And I type "WRONG"
    Then the stderr should contain "Error creating repository: Unauthorized (HTTP 401)"
    And the exit status should be 1
    And the file "../home/.config/hub" should not exist
