import Foundation

public extension MBArtist {

    static var Nirvana: MBArtist {
        let json = """
        {
          "id": "5b11f4ce-a62d-471e-81fc-a69a8278c7da",
          "name": "Nirvana",
          "sort-name": "Nirvana",
          "type-id": "e431f5f6-b5d2-343d-8b36-72607fffb74b",
          "type": "Group",
          "disambiguation": "90s US grunge band",
          "gender": null,
          "gender-id": null,
          "country": "US",
          "area": {
            "disambiguation": "",
            "id": "489ce91b-6658-3307-9877-795b68554c98",
            "sort-name": "United States",
            "name": "United States",
            "iso-3166-1-codes": ["US"]
          },
          "begin-area": {
            "id": "a640b45c-c173-49b1-8030-973603e895b5",
            "disambiguation": "",
            "name": "Aberdeen",
            "sort-name": "Aberdeen"
          },
          "end-area": null,
          "life-span": {
            "ended": true,
            "begin": "1988-01",
            "end": "1994-04-05"
          },
          "isnis": ["0000000123486830", "0000000123487390"],
          "ipis": [ ],
          "aliases": [
            {
              "end": null,
              "begin": null,
              "sort-name": "Nirvana US",
              "name": "Nirvana US",
              "type-id": null,
              "primary": null,
              "locale": null,
              "type": null,
              "ended": false
            },
            {
              "primary": true,
              "type-id": "894afba6-2816-3c24-8072-eadb66bd04bc",
              "name": "ニルヴァーナ",
              "sort-name": "ニルヴァーナ",
              "begin": null,
              "end": null,
              "ended": false,
              "type": "Artist name",
              "locale": "ja"
            }
          ]
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        return try! decoder.decode(MBArtist.self, from: json)

    }
    
    static var NIN_Event: MBEvent {
        let json = """
        {
            "id": "fe39727a-3d21-4066-9345-3970cbd6cca4",
            "name": "Nine Inch Nails at Arena Riga",
            "disambiguation": "",
            "type-id": "ef55e8d7-3d00-394a-8012-f5506a29ff0b",
            "type": "Concert",
            "life-span": {
              "end": "2014-05-06",
              "ended": true,
              "begin": "2014-05-06"
            },
            "time": "19:00",
            "cancelled": false,
            "setlist": "* Copy of A * 1,000,000 * Terrible Lie * March of the Pigs * Piggy * The Frail * The Wretched * The Becoming * Gave Up * Closer * Find My Way * Me, I'm Not * Came Back Haunted * The Great Destroyer * Eraser * Wish * Burn * The Hand That Feeds * Head Like a Hole # Encore * Hurt",
            "relations": [
              {
                "type-id": "936c7c95-3156-3889-a062-8a0cd57f8946",
                "type": "main performer",
                "direction": "backward",
                "target-type": "artist",
                "artist": {
                  "id": "b7ffd2af-418f-4be2-bdd1-22f8b48613da",
                  "name": "Nine Inch Nails",
                  "sort-name": "Nine Inch Nails",
                  "disambiguation": ""
                },
                "begin": null,
                "end": null,
                "ended": false,
                "target-credit": "",
                "source-credit": "",
                "attributes": [],
                "attribute-ids": {},
                "attribute-values": {}
              },
              {
                "type-id": "492a850e-97eb-306a-a85e-4b6d98527796",
                "type": "support act",
                "direction": "backward",
                "target-type": "artist",
                "artist": {
                  "id": "f7f32d93-0801-45cb-9f5a-e68f640649f4",
                  "name": "Cold Cave",
                  "sort-name": "Cold Cave",
                  "disambiguation": ""
                },
                "begin": null,
                "end": null,
                "ended": false,
                "target-credit": "",
                "source-credit": "",
                "attributes": [],
                "attribute-ids": {},
                "attribute-values": {}
              },
              {
                "type-id": "e2c6f697-07dc-38b1-be0b-83d740165532",
                "type": "held at",
                "direction": "forward",
                "target-type": "place",
                "place": {
                  "id": "478558f9-a951-4067-ad91-e83f6ba63e74",
                  "name": "Arēna Rīga",
                  "address": "Skanstes iela 21, Rīga, Latvia",
                  "coordinates": {
                    "longitude": 24.121403,
                    "latitude": 56.967989
                  },
                  "disambiguation": "",
                  "type-id": "a77c11f6-82fa-3cc0-9041-ac60e5f6e024",
                  "type": "Indoor arena",
                  "area": {
                    "id": "9c612199-d66f-4109-aedc-67ab26e0a43b",
                    "name": "Rīga",
                    "sort-name": "Rīga",
                    "disambiguation": "",
                    "iso-3166-2-codes": ["LV-RIX"]
                  }
                },
                "begin": null,
                "end": null,
                "ended": false,
                "target-credit": "",
                "source-credit": "",
                "attributes": [],
                "attribute-ids": {},
                "attribute-values": {}
              }
            ],
            "aliases": []
        }

        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        return try! decoder.decode(MBEvent.self, from: json)
    }
}

