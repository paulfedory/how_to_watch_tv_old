# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HowToWatchTv.Repo.insert!(%HowToWatchTv.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias HowToWatchTv.Repo
alias HowToWatchTv.Recommendation

Repo.delete_all(Recommendation)

Repo.insert! %Recommendation{
  name: "Search Party",
  tvdb_id: "309523",
  description: "Search Party is a dark comedy about four self-absorbed twenty-somethings who become entangled in an ominous mystery. When a former college acquaintance suddenly disappears, it's time to form a Search Party.",
  reason: "The way \"Search Party\" plays with tone is fantastic: I found myself laughing at the selfish millenials and yet I was invested in the mystery at the centre of the story.",
  image_url: "https://thetvdb.com/banners/fanart/original/309523-3.jpg",
  thumbnail_url: "https://thetvdb.com/banners/_cache/fanart/original/309523-3.jpg"
}

Repo.insert! %Recommendation{
  name: "Westworld",
  tvdb_id: "296762",
  description: "Westworld is a dark odyssey about the dawn of artificial consciousness and the evolution of sin. Set at the intersection of the near future and the reimagined past, it explores a world in which every human appetite, no matter how noble or depraved, can be indulged.",
  reason: "A great cast, inventive non-linear storytelling & non-exploitative plot twists kept me guessing, and it paid off.",
  image_url: "https://thetvdb.com/banners/fanart/original/296762-7.jpg",
  thumbnail_url: "https://thetvdb.com/banners/_cache/fanart/original/296762-7.jpg"
}

Repo.insert! %Recommendation{
  name: "The Affair",
  tvdb_id: "270439",
  description: "The Affair explores the emotional effects of an extramarital relationship. Set in Montauk at the end of Long Island, the provocative drama unfolds separately from both the male and female perspectives, using the distinct memory biases of both to tell the story.",
  reason: "A study of bad relationships between horrible people, I'm intrigued by the unreliable narration and the colourful backdrops of Montauk and Brooklyn.",
  image_url: "https://thetvdb.com/banners/fanart/original/270439-8.jpg",
  thumbnail_url: "https://thetvdb.com/banners/_cache/fanart/original/270439-8.jpg"
}

Repo.insert! %Recommendation{
  name: "The OA",
  tvdb_id: "321060",
  description: "Prairie Johnson, blind as a child, comes home to the community she grew up in with her sight restored. Some hail her a miracle, others a dangerous mystery, but Prairie won’t talk with the FBI or her parents about the seven years she went missing.",
  reason: "The sort of navel-gazing, contemplative sci-fi I expect from its creators Brit Marling and Zal Batmanglij, \"The OA\" left me thinking about death and wondering if the mysterious plotholes even matter to the bigger story being told.",
  image_url: "https://thetvdb.com/banners/fanart/original/321060-4.jpg",
  thumbnail_url: "https://thetvdb.com/banners/_cache/fanart/original/321060-4.jpg"
}

