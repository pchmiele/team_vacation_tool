defmodule TeamVacationTool.GraphQL.Schema do
  use Absinthe.Schema
  alias TeamVacationTool.GraphQL.Resolvers

  import_types TeamVacationTool.GraphQL.Types.Types

  query do
    field :teams, list_of(:team) do
      resolve &Resolvers.TeamResolver.all/3
    end
    field :user, :user do
      arg :id, non_null(:id)

      resolve &Resolvers.UserResolver.find/3
    end
    field :users, list_of(:user) do
      resolve &Resolvers.UserResolver.all/3
    end

    field :profile, :user do
      resolve &Resolvers.UserResolver.profile/2
    end

    field :current_team, :team do
      resolve &Resolvers.TeamResolver.current_team/2
    end

  end

  mutation do
    field :signin, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &Resolvers.UserResolver.sign_in/2
    end

    field :signup, type: :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &Resolvers.UserResolver.sign_up/2
    end
  end

end
