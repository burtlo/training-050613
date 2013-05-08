require 'spec_helper'

class SpecsSessionsController < ApplicationController
  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end

describe 'Our applications authentication' do

  context 'when logged out' do
    it "user has the ability to login" do
      visit root_path
      expect(page).to have_link('Login',href: login_path)
    end
  end

  context 'when logged in' do
    before do
      Rails.application.routes.draw do
        root to: "site#index"
        get '/fake_login' => 'specs_sessions#create'
        delete '/logout' => "sessions#destroy"
      end

      user = User.create(name: 'Jane Doe')
      visit fake_login_path(user_id: user.id)
    end

    after do
      Rails.application.reload_routes!
    end

    it "user has the ability to logout" do
      expect(page).to have_link('Logout',href: logout_path)
    end
  end
end