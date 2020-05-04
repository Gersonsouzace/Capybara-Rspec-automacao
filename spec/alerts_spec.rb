describe 'Testando Alertas', :alert do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/javascript_alerts'
    end

    it 'alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it 'sim confirma' do
        
        click_button 'Confirma'
        
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'não confirma' do
        click_button 'Confirma'
        
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'prompt' do
        accept_prompt(with: 'Gerson') do
            click_button 'Prompt'
        end
        expect(page).to have_content 'Olá, Gerson'    
    end

    it 'dismiss prompt', :dismiss do

        dismiss_prompt do
            click_button 'Prompt'
        end
        expect(page).to have_content 'Olá, null'
    end
end