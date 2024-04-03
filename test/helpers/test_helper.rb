def sign_in(email, password)
    post session_url, params: { email: email, senha: password }
end