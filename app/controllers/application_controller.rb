class ApplicationController < ActionController::API
  # リクエスト処理の際のRailsのトークンを切っておく
  # NoMethodErrorが出たからコメントアウト、APIモードだと以下不要？
  # protect_from_forgery with: :null_session
end