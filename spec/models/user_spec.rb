require 'rails_helper'

describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき'
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上（半角英数字含む）であれば登録できる" do
        @user.password = "terai0"
        @user.password_confirmation = "terai0"
        expect(@user).to be_valid
      end

      context '新規登録がうまくいかないとき'
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "email(@含む）が空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email:"test@mail.com")
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "paswrodが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it "passwordが存在してもpaswrod_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank") 
      end  
      it 'family_nameが全角入力（ひらがな、カタカナ、漢字）でなければ登録できないこと' do
          @user.family_name = "ｱｲｳｴｵ" 
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it 'first_nameが全角入力（ひらがな、カタカナ、漢字）入力でなければ登録できないこと' do
        @user.first_name = "ｱｲｳｴｵ" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
    end

      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")   
      end 
      it 'family_name_kanaが全角カタカナ出ないと登録できない' do
        @user.family_name_kana = "てらいひろき" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角カタカナ出ないと登録できない" do
        @user.first_name_kana = "てらいひろき"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end


      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
  end
end
