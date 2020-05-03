describe 'Caixa de Seleção', :dropdown do 

    it 'item especifico' do #cenario
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3 #temp
    end


    it 'item especifico com find' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3 #temp
    end

    it 'qualquer item', :sample do

        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end

end