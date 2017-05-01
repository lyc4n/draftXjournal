require 'rails_helper'

RSpec.describe DraftsController do

  let(:user){create(:user)}

  describe 'GET new' do
    it_behaves_like 'a user page', ->{get :new}

    it 'renders the new template' do
      stub_login_user
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:valid_params){{draft: {title: 'Hungry Stomach', content: 'Wants **burger** :)'}}}
    let(:invalid_params){{draft: {title: 'Hungry Stomach', content: ''}}}

    it_behaves_like 'a user page', ->{post :create}

    context 'when params are valid' do
      before{sign_in user}
      subject{post :create, params: valid_params}

      it 'saves the user\'s draft to the database' do
        expect{subject}.to change{user.drafts.count}.by(1)
      end

      it 'redirects to the root url' do
        subject
        expect(response).to redirect_to(root_url)
      end

      it 'gives a success flash message' do
        subject
        expect(flash[:success]).to_not be_nil
      end
    end

    context 'when not all params are valid' do
      before{sign_in user}
      subject{post :create, params: invalid_params}

      it 'gives flash error message' do
        subject
        expect(flash[:error]).to_not be_nil
      end

      it 'does not save to database' do
        expect{subject}.to change{user.drafts.count}.by(0)
      end

      it 'renders the new template' do
        subject
        expect(response).to render_template(:new)
      end
    end
  end
end
