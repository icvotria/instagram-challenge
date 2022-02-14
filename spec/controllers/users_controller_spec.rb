require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { user: { name: 'name', username: 'username', email: 'email@test.com', password: 'password' } }
      
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a user' do
      post :create, params: { user: { name: 'name', username: 'username', email: 'email@test.com', password: 'password' } }
      
      expect(User.find_by(email: 'email@test.com')).to be
    end
  end

  describe 'DELETE /' do
    it 'deletes a user', :delete => true do
      user = User.create({ name: 'name', username: 'username', email: 'email@test.com', password: 'password' })
      
      expect(User.find_by(id: user.id)).to be
      delete :destroy, params: { id: user.id }
      
      expect(User.find_by(id: user.id)).not_to be
    end
  end

  describe 'PUT /' do
    it 'updates a user', :put => true do
      user = User.create({ name: 'name', username: 'username', email: 'email@test.com', password: 'password' })
      
      expect(User.find(user.id).name).to eq 'name'
      put :update, params: { id: user.id, :user => {:name => 'different name'} }
      
      expect(User.find(user.id).name).to eq 'different name'
      
      expect(User.find_by_name('different name')).to eq(user)
    end

    it 'fails to update a user correctly' do
      user = User.create({ name: 'name', username: 'username', email: 'email@test.com', password: 'password' })
      
      expect(User.find(user.id).password).to eq 'password'
      put :update, params: { id: user.id, :user => {:password => 'pw'} }
      
      expect(User.find(user.id).password).to eq 'password'
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      
      expect(response).to have_http_status(200)
    end
  end
end
