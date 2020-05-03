describe 'Mouse Hovers', :hover do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/hovers'
    end


    it 'qunado passo o mouse sobre o blade' do
       card = find('img[alt=Blade]')
       card.hover

       expect(page).to have_content 'Nome: Blade'
    end

    it 'qunado passo o mouse sobre o Pantera Negra' do
        card = find('img[alt="Pantera Negra"]')
        card.hover
 
        expect(page).to have_content 'Nome: Pantera Negra'
     end

     it 'qunado passo o mouse sobre o Homem aranha' do
        card = find('img[alt="Homem Aranha"]')
        card.hover
 
        expect(page).to have_content 'Nome: Homem Aranha'
     end

    after(:each) do
        sleep 0.5 #temp ver e execução 
    end
end