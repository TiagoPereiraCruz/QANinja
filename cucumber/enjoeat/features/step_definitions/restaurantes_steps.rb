Dado("que tenho uma lista de restaurantes") do
    @restaurant_data = [
        { name: 'Bread & Bakery', category: 'Padaria', delivery_time: '25 minutos', rating: 4.9 },
        { name: 'Burger House', category: 'Hamburgers', delivery_time: '30 minutos', rating: 3.5},
        { name: 'Coffe Corner', category: 'Cafeteria', delivery_time: '20 minutos', rating: 4.8},
        { name: 'Green Food', category: 'Saudável', delivery_time: '40 minutos', rating: 4.1 },
        { name: 'Ice Cream', category: 'Sorvetes', delivery_time: '1 hora', rating: 0},
        { name: 'Tasty Treats', category: 'Doces', delivery_time: '20 minutos', rating: 4.4}
    ]
end

Quando("acesso a lista de restaurantes") do
    visit '/restaurants'
end

Então("vejo todas as opções disponíveis") do
   restaurantes = all('.restaurant-item') # o método all devolve uma coleção de elementos (array)
   expect(restaurantes.size).to be > 0
end

Então("cada restaurante deve exibir sua categoria") do

    restaurants = all('.restaurant-item')

    @restaurant_data.each_with_index do |value, index|
        # puts value[:category]
        # puts restaurants[index].text
        expect(restaurants[index]).to have_text value[:category]
    end
end

Então("cada restaurante deve exibir o tempo de entrega") do

    restaurants = all('.restaurant-item')

    @restaurant_data.each_with_index do |value, index|
        # puts value[:category]
        # puts restaurants[index].text
        expect(restaurants[index]).to have_text value[:delivery_time]
    end
end

Então("cada restaurante deve exibir sua nota de avaliação") do

    restaurants = all('.restaurant-item')

    @restaurant_data.each_with_index do |value, index|
        # puts value[:category]
        # puts restaurants[index].text
        expect(restaurants[index]).to have_text value[:rating]
    end
end