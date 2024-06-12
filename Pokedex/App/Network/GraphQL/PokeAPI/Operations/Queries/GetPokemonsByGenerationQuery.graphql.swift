// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PokeAPI {
  class GetPokemonsByGenerationQuery: GraphQLQuery {
    static let operationName: String = "GetPokemonsByGeneration"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query GetPokemonsByGeneration($generationId: Int!) { pokemon_v2_generation_by_pk(id: $generationId) { __typename pokemon_v2_pokemonspecies(order_by: { id: asc }) { __typename name id pokemon_v2_pokemons { __typename height weight pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } } pokemon_v2_evolutionchain { __typename pokemon_v2_pokemonspecies { __typename id name evolves_from_species_id pokemon_v2_pokemonevolutions { __typename min_level id } pokemon_v2_pokemonspecy { __typename name } } } } } }"#
      ))

    public var generationId: Int

    public init(generationId: Int) {
      self.generationId = generationId
    }

    public var __variables: Variables? { ["generationId": generationId] }

    struct Data: PokeAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PokeAPI.Objects.Query_root }
      static var __selections: [Apollo.Selection] { [
        .field("pokemon_v2_generation_by_pk", Pokemon_v2_generation_by_pk?.self, arguments: ["id": .variable("generationId")]),
      ] }

      /// fetch data from the table: "pokemon_v2_generation" using primary key columns
      var pokemon_v2_generation_by_pk: Pokemon_v2_generation_by_pk? { __data["pokemon_v2_generation_by_pk"] }

      /// Pokemon_v2_generation_by_pk
      ///
      /// Parent Type: `Pokemon_v2_generation`
      struct Pokemon_v2_generation_by_pk: PokeAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_generation }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_pokemonspecies", [Pokemon_v2_pokemonspecy].self, arguments: ["order_by": ["id": "asc"]]),
        ] }

        /// An array relationship
        var pokemon_v2_pokemonspecies: [Pokemon_v2_pokemonspecy] { __data["pokemon_v2_pokemonspecies"] }

        /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy
        ///
        /// Parent Type: `Pokemon_v2_pokemonspecies`
        struct Pokemon_v2_pokemonspecy: PokeAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspecies }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("id", Int.self),
            .field("pokemon_v2_pokemons", [Pokemon_v2_pokemon].self),
            .field("pokemon_v2_evolutionchain", Pokemon_v2_evolutionchain?.self),
          ] }

          var name: String { __data["name"] }
          var id: Int { __data["id"] }
          /// An array relationship
          var pokemon_v2_pokemons: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemons"] }
          /// An object relationship
          var pokemon_v2_evolutionchain: Pokemon_v2_evolutionchain? { __data["pokemon_v2_evolutionchain"] }

          /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon
          ///
          /// Parent Type: `Pokemon_v2_pokemon`
          struct Pokemon_v2_pokemon: PokeAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemon }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("height", Int?.self),
              .field("weight", Int?.self),
              .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
            ] }

            var height: Int? { __data["height"] }
            var weight: Int? { __data["weight"] }
            /// An array relationship
            var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }

            /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemontype
            ///
            /// Parent Type: `Pokemon_v2_pokemontype`
            struct Pokemon_v2_pokemontype: PokeAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemontype }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("pokemon_v2_type", Pokemon_v2_type?.self),
              ] }

              /// An object relationship
              var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }

              /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
              ///
              /// Parent Type: `Pokemon_v2_type`
              struct Pokemon_v2_type: PokeAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_type }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String.self),
                ] }

                var name: String { __data["name"] }
              }
            }
          }

          /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_evolutionchain
          ///
          /// Parent Type: `Pokemon_v2_evolutionchain`
          struct Pokemon_v2_evolutionchain: PokeAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_evolutionchain }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("pokemon_v2_pokemonspecies", [Pokemon_v2_pokemonspecy].self),
            ] }

            /// An array relationship
            var pokemon_v2_pokemonspecies: [Pokemon_v2_pokemonspecy] { __data["pokemon_v2_pokemonspecies"] }

            /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy
            ///
            /// Parent Type: `Pokemon_v2_pokemonspecies`
            struct Pokemon_v2_pokemonspecy: PokeAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspecies }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", Int.self),
                .field("name", String.self),
                .field("evolves_from_species_id", Int?.self),
                .field("pokemon_v2_pokemonevolutions", [Pokemon_v2_pokemonevolution].self),
                .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
              ] }

              var id: Int { __data["id"] }
              var name: String { __data["name"] }
              var evolves_from_species_id: Int? { __data["evolves_from_species_id"] }
              /// An array relationship
              var pokemon_v2_pokemonevolutions: [Pokemon_v2_pokemonevolution] { __data["pokemon_v2_pokemonevolutions"] }
              /// An object relationship
              var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }

              /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution
              ///
              /// Parent Type: `Pokemon_v2_pokemonevolution`
              struct Pokemon_v2_pokemonevolution: PokeAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonevolution }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("min_level", Int?.self),
                  .field("id", Int.self),
                ] }

                var min_level: Int? { __data["min_level"] }
                var id: Int { __data["id"] }
              }

              /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonspecy
              ///
              /// Parent Type: `Pokemon_v2_pokemonspecies`
              struct Pokemon_v2_pokemonspecy: PokeAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspecies }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String.self),
                ] }

                var name: String { __data["name"] }
              }
            }
          }
        }
      }
    }
  }

}
