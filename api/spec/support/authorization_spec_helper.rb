module AuthorizationSpecHelper
  def sign_in(sign_in_type)
    user = Student.find_by(email: 'user@example.com')
    post "/api/auth/#{sign_in_type}/sign_in",
         params: { email: user[:email], password: 'password' },
         as: :json

    response.header.slice('client', 'access-token', 'uid')
  end

  def sign_in_id(sign_in_type)
    user = Student.find_by(email: 'user@example.com')
    post "/api/auth/#{sign_in_type}/sign_in",
         params: { email: user[:email], password: 'password' },
         as: :json

    body = JSON.parse(response.body)
    headers = response.header.slice('client', 'access-token', 'uid')

    [headers, body['data']['id']]
  end
end
