require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
    setup do
        @person = people(:admin)
    end

    test 'deve ter um formulário de login' do
        get new_session_url

        assert_response :success
        assert_select 'form[action=?]', sessions_path do
            assert_select 'input[type=text] [name=\'email\']'
            assert_select 'input[type=password] [name=\'senha\']'
            assert_select 'input[type=submit]'
        end
    end

    test 'não deve fazer login com senha errada' do
        post sessions_url, params: { email: @person.email, senha: 'naninanão' }
        
        assert_nil session[:id]
        assert_redirected_to new_session_url
    end

    test 'deve fazer login' do
        post sessions_url, params: { email: @person.email, senha: 'secrets' }

        assert_equal @person.id, session[:id]
        assert_equal @person.name session[:name]
        assert_equal @person.admin session[:admin]
        assert_equal "Olá, #{@person.name}!", flash[:notice]
        assert_redirected_to people_path
    end

    test 'deve fazer logout' do
        delete sessions_url(@person)

        assert_nil session[:id]
        assert_nil session[:name]
        assert_nil session[:admin]
        assert_redirected_to new_session_url
    end

end