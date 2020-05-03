describe 'Upload', :upload do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        puts @arquivo
        @imagem = Dir.pwd + '/spec/fixtures/qaninja.png'
    end


    it 'Testando Upload arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'Testando Upload imagem' do
        attach_file('file-upload',@imagem)
        click_button 'Upload'
        #sleep 5 #tempo para carregar a imagem #foi configurado tempo de espera no spec helper
        img = find('#new-image')
        expect(img[:src].to inlcude '/upload/qaninja.png')
    end

    after(:each) do
        sleep 3 #temp
    end
end