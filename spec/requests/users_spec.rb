describe 'DELETE #destroy' do
      let(:admin_user) { create(:user, admin: true) }
      let(:target_user) { create(:user) }
    
      before do
        admin_user
        target_user
        post login_path, params: { session: { email: admin_user.email, password: admin_user.password } }
      end
    
      it 'ユーザーがデータベースから削除される' do
        expect {
          delete user_path(target_user)
        }.to change(User, :count).by(-1)
      end
  
      it '302 Found ステータスコードを返す' do
        delete user_path(target_user)
        expect(response).to have_http_status(:found)
      end
  
      it 'フラッシュメッセージで「「ユーザー名」のデータを削除しました」と返す' do
        delete user_path(target_user)
        expect(flash[:success]).to eq("#{target_user.name}のデータを削除しました。")
      end
    
      it 'ユーザー一覧ページにリダイレクトされる' do
        delete user_path(target_user)
        expect(response).to redirect_to(users_url)
      end
    end