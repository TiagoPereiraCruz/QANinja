#language: pt

@green-food
Funcionalidade: Finalizar pedido
    Para que eu possa receber o pedidono meu endereço
    Sendo um usuário que fechou o carrinho com itens
    Posso finalizar o meu pedido

    # BDD (Desenvolvimento guiado por comportamento) => voltado para o negócio
    # BDT (Teste guiado por comportamento) => voltado para a fase de testes

    # sai do modelo tradicional, para o módelo que tem valor ao negócio
    # deixa de somente achar bugs, passa a ser estratégico

    # Cenario: Finalizar pedido com Cartão Refeição

    #     Dado que eu fechei o meu carrinho
    #     E preencho o campo nome com "Tiago"
    #     E preencho o campo email com "eu@tiago.io"
    #     E preencho o campo confirmação de email com "eu@tiago.io"
    #     E preencho a rua com "Nival Vieira Leão"
    #     E preencho o numero da rua com "1000"
    #     E preencho o campo complemento com "17o andar"
    #     E clico na forma de pagamento "Cartão Refeição"
    #     Quando eu clico em "Finalizar Pedido"
    #     Então devo ver uma mensagem de sucesso

    Cenario: Finalizar pedido com Cartão Refeição

        Dado que eu fechei o pedido com os itens:
             | quantidade | nome                | descricao                                | subtotal |
             | 1          | Suco Detox          | Suco de couve, cenoura, salsinha e maçã. | R$ 14,90 |
             | 2          | Hamburger de Quinoa | Cheio de fribas e muito saboroso.        | R$ 21,00 |
        E informei os meus dados de entrega:
           | nome        | Fernando          |
           | email       | eu@tiago.io       |
           | rua         | Nival Vieira Leão |
           | numero      | 1000              |
           | complemento | 17o andar         |
        Quando eu finalizo o pedido com "Cartão Refeição"
        Então devo ver a seguinte mensagem:
        # tecnica doc-string
        """
        Seu pedido foi recebido pelo restaurante. Prepare a mesa que a comida está chegando!
        """