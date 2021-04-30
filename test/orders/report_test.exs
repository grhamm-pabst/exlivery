defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      build_list(2, :order)
      |> Enum.map(fn order -> OrderAgent.save(order) end)

      expected_response =
        "12345678900,pizza,1,35.5japonesa,1,20.50,56.00\n" <>
          "12345678900,pizza,1,35.5japonesa,1,20.50,56.00\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
