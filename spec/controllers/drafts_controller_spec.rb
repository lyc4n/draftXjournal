require 'rails_helper'

RSpec.describe DraftsController do

  let(:user){create(:user)}
  let(:draft){create(:draft, user: user)}
  let(:valid_params){{draft: {title: 'Hungry Stomach', content: 'Wants **burger** :)'}}}
  let(:invalid_params){{draft: {title: 'Hungry Stomach', content: ''}}}

  describe 'GET new' do
    it_behaves_like 'a user page', ->{get :new}

    it 'renders the new template' do
      stub_login_user
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
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

  describe 'GET edit' do
    context 'authorization' do
      it_behaves_like 'a user page', ->{get :edit, params: {id: 1}}
    end

    context 'when correct user is signed in' do
      before{sign_in user}

      it 'renders the edit page' do
        get :edit, params: {id: draft}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    context 'authorization' do
      it_behaves_like 'a user page', ->{get :edit, params: {id: 1}}
    end

    context 'when user who owns the draft is logged in' do
      before do
        draft
        sign_in user
      end

      subject do
        put :update, params: {id: draft.id}.merge(request_params)
      end

      context 'when parameters are valid' do
        let(:request_params){valid_params}

        it 'updates the draft' do
          expect{subject}.to change{draft.reload.content}
        end

        it 'shows a flash message' do
          subject
          expect(flash[:success]).to_not be_nil
        end

        it 'redirects to the show page' do
          subject
          expect(response).to redirect_to(draft_path(draft))
        end
      end

      context 'when parameters are not valid' do
        let(:request_params){invalid_params}

        it 'does not update the draft' do
          expect{subject}.to_not change{draft.reload.content}
        end

        it 'shows a flash message' do
          subject
          expect(flash[:error]).to_not be_nil
        end

        it 'rerenders the edit page' do
          subject
          expect(response).to render_template(:edit)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    context 'authorization' do
      it_behaves_like 'a user page', ->{get :edit, params: {id: 1}}
    end

    context 'when user who owns the draft is logged in' do
      before do
        draft
        sign_in user
      end

      subject do
        delete :destroy, params: {id: draft}
      end

      it 'deletes the draft' do
        expect{subject}.to change(Draft, :count).by(-1)
      end

      it 'redirects to the root page' do
        subject
        expect(response).to redirect_to(root_path)
      end

      it 'shows a flash message' do
        subject
        expect(flash[:success]).to_not be_nil
      end
    end
  end
end
