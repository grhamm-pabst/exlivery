defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Item
  alias Exlivery.Orders.Order

  def create(file_name \\ "report.csv") do
    order_list = build_order_list()

    File.write(file_name, order_list)
  end

  defp build_order_list() do
    OrderAgent.list_all()
    |> Map.values()
    |> Enum.map(fn order -> order_string(order) end)
  end

  defp order_string(%Order{user_cpf: user_cpf, items: items, total_price: total_price}) do
    items_string = Enum.map(items, fn item -> item_string(item) end)
    "#{user_cpf},#{items_string},#{total_price}\n"
  end

  defp item_string(%Item{category: category, quantity: quantity, unity_price: unity_price}) do
    "#{category},#{quantity},#{unity_price}"
  end
end
