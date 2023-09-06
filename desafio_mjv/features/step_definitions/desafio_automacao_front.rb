Dado('que acesso o site Automation Practice') do
     visit '/Register.html'
end

 Quando('preencho todos os campos do formulário') do
     #Your Personal Details
     fill_in(id='AccountFrm_firstname', with: 'Tiago')
     fill_in(id='AccountFrm_lastname', with: 'Lima')
     fill_in(id='AccountFrm_email', with: 'tiago.lima634@gmail.com')
     fill_in(id='AccountFrm_telephone', with: '11960611215')
     #Your Address
     fill_in(id='AccountFrm_address_1', with: 'Rua das Ovelhas, 35')
     fill_in(id='AccountFrm_city', with: 'São Paulo')
     find(id='AccountFrm_country_id').set 'Bra'
     find('ul', text: 'Brazil').click
     find(id='AccountFrm_zone_id').set 'Sao'
     find('ul', text: 'Sao Paulo').click
     #Login Details
     fill_in(id='AccountFrm_loginname', with: 'desafio_tiago') 
     fill_in(id='AccountFrm_password', with: 'senha1234') 
     fill_in(id='AccountFrm_confirm', with: 'senha1234') 
     #Newsletter
     check(id='AccountFrm_newsletter1', allow_label_click: true)
     check(id='AccountFrm_agree', allow_label_click: true)
 end

Entao('eu verifico se o formulário foi submetido corretamente') do
    expect(page).to have_current_path('https://demo.automationtesting.in/Register.html', url: true)
    @texto = find(class='maintext')
    expect(@texto.text).to eql 'YOUR ACCOUNT HAS BEEN CREATED!'