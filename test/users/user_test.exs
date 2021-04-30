defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, return the user" do
      response = User.build("Grhamm", "grhamm@email.com", "12345678900", 21, "rua braba")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns error" do
      response = User.build("Grhamm", "grhammpabst@hotmail.com", "12345678", 17, "Rua tal")

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
