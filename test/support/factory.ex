defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Grhamm",
      email: "grhamm@email.com",
      cpf: "12345678900",
      age: 21,
      address: "rua braba"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "pizza de peperoni",
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "rua braba",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("56.00"),
      user_cpf: "12345678900"
    }
  end
end
