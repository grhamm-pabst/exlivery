defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  import Exlivery.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when all params are valid, saves the user", %{cpf: cpf} do
      user = build(:user, cpf: cpf)

      response = CreateOrUpdate.call(user)

      expected_response = {:ok, "User info has been saved"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      user = build(:user, age: 17)

      response = CreateOrUpdate.call(user)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
