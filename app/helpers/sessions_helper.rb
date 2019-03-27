module SessionsHelper
  def log_in(user)
    # ブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成される。
    # この後のページで、session[:user_id]を使ってユーザーIDを元通りに取り出すことができる。
    # cookiesメソッドとは異なり、ブラウザを閉じた瞬間に有効期限が切れる。
    # こんなんでもsession methodというメソッドらしい。
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
