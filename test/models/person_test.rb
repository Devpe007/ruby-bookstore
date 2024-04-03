require "test_helper"

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = people(:admin)
  end

  test 'tem quer ser válido sem alterações' do
    assert @person.valid?
  end

  test 'não pode ter nome vazio' do
    @person.name = ''
    assert !@person.valid?
  end

  test 'não pode ter nome maior que 50 caracteres' do
    @person.name = '*' * 51
    assert !@person.valid?
  end

  test 'pode ter email vazio' do
    @person.email = ''
    assert @person.valid?
  end

  test 'o email deve ser salvo em minúsculas' do
    email = 'TAQ@BLUEFISH.COM.BR'
    @person.email = email
    assert @person.save
    assert_equal email.downcase, @person.email
  end

  test 'não pode ter email inválido' do
    @person.email = 'foo@bar'
    assert !@person.valid?
  end

  test 'não pode ter email repetido' do
    new_person = Person.new(@person.attributes)
    assert !new_person.valid?
  end

  test 'a data de nascimento não pode ser menor que 16 anos' do 
    @person.born_at = Date.current - 15.years
    assert !@person.valid?
  end

  test 'a data de nascimento pode ser maior que 16 anos' do 
    @person.born_at = Date.current - 17.years
    assert @person.valid?
  end

  test 'deve autenticar a pessoa' do
    assert @person.authenticate('secret')
  end

  test 'não deve autenticar a pessoa' do
    assert !@person.authenticate('naninanão')
  end

  test 'deve ter um metodo para autenticar a pessoa através de email e senha' do
      assert_respond_to Person, :auth
  end

  test 'deve autenticar com email e senha' do
    assert_not_nil Person.auth(@person.email, 'secret')
  end

  test 'não deve autenticar com email e senha' do
    assert_nil Person.auth(@person.email, 'naninanão')
  end

  test 'deve ter um escopo para retornar usuarios por dominio' do
    assert_respond_to Person, :by_domain
    assert_equal 2, Person.by_domain('teste.com').size
  end

  test 'deve ter um escopo padrão para retornar os usuários em ordem alfabética' do
    people = Person.all
    assert people.first.name < people.last.name, "#{people.last.name} deveria estar anes de #{people.first.name}"
  end
end
