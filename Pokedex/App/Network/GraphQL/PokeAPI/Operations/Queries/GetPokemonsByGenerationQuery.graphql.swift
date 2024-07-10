// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PokeAPI {
  class GetPokemonsByGenerationQuery: GraphQLQuery {
    static let operationName: String = "GetPokemonsByGeneration"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query GetPokemonsByGeneration($generationId: Int!) { pokemon_v2_generation_by_pk(id: $generationId) { __typename pokemon_v2_pokemonspecies(order_by: { id: asc }) { __typename id name gender_rate hatch_counter capture_rate base_happiness pokemon_v2_growthrate { __typename name } pokemon_v2_pokemons { __typename height weight base_experience pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } pokemon_v2_pokemonstats { __typename base_stat effort pokemon_v2_stat { __typename name } } pokemon_v2_encounters { __typename location_area_id pokemon_v2_version { __typename name version_group_id } } pokemon_v2_pokemonabilities { __typename is_hidden pokemon_v2_ability { __typename name } } } pokemon_v2_pokemonegggroups { __typename pokemon_v2_egggroup { __typename name } } pokemon_v2_pokemonspeciesflavortexts( where: { pokemon_v2_language: { name: { _eq: "en" } } } limit: 1 order_by: { id: desc } ) { __typename flavor_text } pokemon_v2_evolutionchain { __typename pokemon_v2_pokemonspecies { __typename id name evolves_from_species_id pokemon_v2_pokemonevolutions { __typename min_level id } pokemon_v2_pokemonspecy { __typename name } } } } } }"#
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
            .field("id", Int.self),
            .field("name", String.self),
            .field("gender_rate", Int?.self),
            .field("hatch_counter", Int?.self),
            .field("capture_rate", Int?.self),
            .field("base_happiness", Int?.self),
            .field("pokemon_v2_growthrate", Pokemon_v2_growthrate?.self),
            .field("pokemon_v2_pokemons", [Pokemon_v2_pokemon].self),
            .field("pokemon_v2_pokemonegggroups", [Pokemon_v2_pokemonegggroup].self),
            .field("pokemon_v2_pokemonspeciesflavortexts", [Pokemon_v2_pokemonspeciesflavortext].self, arguments: [
              "where": ["pokemon_v2_language": ["name": ["_eq": "en"]]],
              "limit": 1,
              "order_by": ["id": "desc"]
            ]),
            .field("pokemon_v2_evolutionchain", Pokemon_v2_evolutionchain?.self),
          ] }

          var id: Int { __data["id"] }
          var name: String { __data["name"] }
          var gender_rate: Int? { __data["gender_rate"] }
          var hatch_counter: Int? { __data["hatch_counter"] }
          var capture_rate: Int? { __data["capture_rate"] }
          var base_happiness: Int? { __data["base_happiness"] }
          /// An object relationship
          var pokemon_v2_growthrate: Pokemon_v2_growthrate? { __data["pokemon_v2_growthrate"] }
          /// An array relationship
          var pokemon_v2_pokemons: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemons"] }
          /// An array relationship
          var pokemon_v2_pokemonegggroups: [Pokemon_v2_pokemonegggroup] { __data["pokemon_v2_pokemonegggroups"] }
          /// An array relationship
          var pokemon_v2_pokemonspeciesflavortexts: [Pokemon_v2_pokemonspeciesflavortext] { __data["pokemon_v2_pokemonspeciesflavortexts"] }
          /// An object relationship
          var pokemon_v2_evolutionchain: Pokemon_v2_evolutionchain? { __data["pokemon_v2_evolutionchain"] }

          /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_growthrate
          ///
          /// Parent Type: `Pokemon_v2_growthrate`
          struct Pokemon_v2_growthrate: PokeAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_growthrate }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
            ] }

            var name: String { __data["name"] }
          }

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
              .field("base_experience", Int?.self),
              .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
              .field("pokemon_v2_pokemonstats", [Pokemon_v2_pokemonstat].self),
              .field("pokemon_v2_encounters", [Pokemon_v2_encounter].self),
              .field("pokemon_v2_pokemonabilities", [Pokemon_v2_pokemonability].self),
            ] }

            var height: Int? { __data["height"] }
            var weight: Int? { __data["weight"] }
            var base_experience: Int? { __data["base_experience"] }
            /// An array relationship
            var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
            /// An array relationship
            var pokemon_v2_pokemonstats: [Pokemon_v2_pokemonstat] { __data["pokemon_v2_pokemonstats"] }
            /// An array relationship
            var pokemon_v2_encounters: [Pokemon_v2_encounter] { __data["pokemon_v2_encounters"] }
            /// An array relationship
            var pokemon_v2_pokemonabilities: [Pokemon_v2_pokemonability] { __data["pokemon_v2_pokemonabilities"] }

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

            /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemonstat
            ///
            /// Parent Type: `Pokemon_v2_pokemonstat`
            struct Pokemon_v2_pokemonstat: PokeAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonstat }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("base_stat", Int.self),
                .field("effort", Int.self),
                .field("pokemon_v2_stat", Pokemon_v2_stat?.self),
              ] }

              var base_stat: Int { __data["base_stat"] }
              var effort: Int { __data["effort"] }
              /// An object relationship
              var pokemon_v2_stat: Pokemon_v2_stat? { __data["pokemon_v2_stat"] }

              /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemonstat.Pokemon_v2_stat
              ///
              /// Parent Type: `Pokemon_v2_stat`
              struct Pokemon_v2_stat: PokeAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_stat }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String.self),
                ] }

                var name: String { __data["name"] }
              }
            }

            /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_encounter
            ///
            /// Parent Type: `Pokemon_v2_encounter`
            struct Pokemon_v2_encounter: PokeAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_encounter }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("location_area_id", Int?.self),
                .field("pokemon_v2_version", Pokemon_v2_version?.self),
              ] }

              var location_area_id: Int? { __data["location_area_id"] }
              /// An object relationship
              var pokemon_v2_version: Pokemon_v2_version? { __data["pokemon_v2_version"] }

              /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_encounter.Pokemon_v2_version
              ///
              /// Parent Type: `Pokemon_v2_version`
              struct Pokemon_v2_version: PokeAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_version }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String.self),
                  .field("version_group_id", Int?.self),
                ] }

                var name: String { __data["name"] }
                var version_group_id: Int? { __data["version_group_id"] }
              }
            }

            /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemonability
            ///
            /// Parent Type: `Pokemon_v2_pokemonability`
            struct Pokemon_v2_pokemonability: PokeAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonability }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("is_hidden", Bool.self),
                .field("pokemon_v2_ability", Pokemon_v2_ability?.self),
              ] }

              var is_hidden: Bool { __data["is_hidden"] }
              /// An object relationship
              var pokemon_v2_ability: Pokemon_v2_ability? { __data["pokemon_v2_ability"] }

              /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability
              ///
              /// Parent Type: `Pokemon_v2_ability`
              struct Pokemon_v2_ability: PokeAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_ability }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String.self),
                ] }

                var name: String { __data["name"] }
              }
            }
          }

          /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonegggroup
          ///
          /// Parent Type: `Pokemon_v2_pokemonegggroup`
          struct Pokemon_v2_pokemonegggroup: PokeAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonegggroup }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("pokemon_v2_egggroup", Pokemon_v2_egggroup?.self),
            ] }

            /// An object relationship
            var pokemon_v2_egggroup: Pokemon_v2_egggroup? { __data["pokemon_v2_egggroup"] }

            /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonegggroup.Pokemon_v2_egggroup
            ///
            /// Parent Type: `Pokemon_v2_egggroup`
            struct Pokemon_v2_egggroup: PokeAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_egggroup }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("name", String.self),
              ] }

              var name: String { __data["name"] }
            }
          }

          /// Pokemon_v2_generation_by_pk.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonspeciesflavortext
          ///
          /// Parent Type: `Pokemon_v2_pokemonspeciesflavortext`
          struct Pokemon_v2_pokemonspeciesflavortext: PokeAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspeciesflavortext }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("flavor_text", String.self),
            ] }

            var flavor_text: String { __data["flavor_text"] }
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
