Report.destroy_all
Trust.destroy_all
Source.destroy_all
Post.destroy_all
Tag.destroy_all
Profile.destroy_all
User.destroy_all

short_term_trade = Tag.create!(name: "Short Term Trade", description: "Aenean vehicula varius mi.")
long_term_trade = Tag.create!(name: "Long Term Trade", description: "Curabitur sagittis at quam eget mattis.")
country_regulation = Tag.create!(name: "Country Regulation", description: "Fusce convallis turpis.")
market_capitalization = Tag.create!(name: "Market Capitalization", description: "Nunc tempor ligula elit.")

adinda = User.create!(email: "adinda@test.com", password: "abc123456")
bruna = User.create!(email: "bruna@test.com", password: "1234567ab")
marc = User.create!(email: "marc@test.com", password: "1234567abc")
sebastian = User.create!(email: "sebastian@test.com", password: "1234567abcd")
fandy = User.create!(email: "fandy@test.com", password: "1234567a")

puts "creating sources..."

google = Source.create!(name: "Google", authenticity: 5, logo: "google-logo.svg", description: "most used search engine in the world", domain: "google.com", secure_connection: true, verified: true)
twitter = Source.create!(name: "Twitter", authenticity: 3, logo: "twitter-logo.svg", description: "online news and social networking service", domain: "twitter.com", secure_connection: true, verified: true)
reddit = Source.create!(name: "Reddit", authenticity: 3, logo: "reddit-logo.svg", description: "an American social news aggregation, web content rating, and discussion website", domain: "reddit.com", secure_connection: true, verified: true)
facebook = Source.create!(name: "Facebook", authenticity: 3, logo: "facebook-logo.svg", description: "an American online social media and social networking service", domain: "reddit.com", secure_connection: true, verified: true)
coinerd = Source.create!(name: "Coinerd", authenticity: 1, logo: "coinerd-logo.svg", description: "first crypto currencies sharing platform based on trust", domain: "coinerd.org", secure_connection: true, verified: true)


puts "creating posts..."

post_1 = Post.create!(
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sagittis at quam eget mattis. Fusce convallis turpis in pellentesque efficitur. Nam velit dui, dapibus non vulputate sed, ultricies sit amet nulla. Nam ac consequat tortor. Nunc tempor ligula elit. Etiam tincidunt, lacus a venenatis ultrices, odio libero aliquet odio, interdum dictum lorem erat ac sem. Pellentesque eget odio orci. Nam nibh risus, tristique sit amet purus in, pellentesque condimentum ex. Aenean vehicula varius mi. Nunc ut arcu eget nunc scelerisque scelerisque.",
  link: "www.google.com",
  images: "http://thoughtforyourpenny.com/wp-content/uploads/cryptocurrency-image-1.jpg",
  is_spam: true,
  user: adinda,
  tags: [short_term_trade, market_capitalization],
)

post_2 = Post.create!(
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sagittis at quam eget mattis. Fusce convallis turpis in pellentesque efficitur. Nam velit dui, dapibus non vulputate sed, ultricies sit amet nulla. Nam ac consequat tortor. Nunc tempor ligula elit. Etiam tincidunt, lacus a venenatis ultrices, odio libero aliquet odio, interdum dictum lorem erat ac sem. Pellentesque eget odio orci. Nam nibh risus, tristique sit amet purus in, pellentesque condimentum ex. Aenean vehicula varius mi. Nunc ut arcu eget nunc scelerisque scelerisque.",
  link: "www.google.com",
  images: "https://steemit-production-imageproxy-upload.s3.amazonaws.com/DQmNgMH9gFniCBx4yXHp3XqVU2hBqGDbFW1c8W44JRBtbij",
  is_spam: false,
  user: bruna,
  tags: [long_term_trade, country_regulation],
)

post_3 = Post.create!(
  content: "Aenean quis justo congue, aliquam dui et, varius lacus. Phasellus mollis commodo quam, sed tincidunt orci commodo sed. Vestibulum et massa eget justo dictum lacinia hendrerit sed sapien. Donec pellentesque eros a sem ornare tincidunt. Proin at enim nec magna varius pellentesque vitae at velit. Sed volutpat ornare mattis. Cras condimentum, diam ut facilisis aliquam, mauris tortor lacinia lacus, id tempus lectus magna vitae nisi. Nulla rhoncus varius ipsum, at finibus ante eleifend et. Donec facilisis neque id odio lobortis fermentum. Phasellus nibh lacus, pulvinar vitae turpis at, auctor hendrerit quam. Duis dui massa, accumsan quis euismod non, finibus in massa.",
  link: "www.google.com",
  images: "https://www.dinheirovivo.pt/wp-content/uploads/2017/06/blockchain-740x415.jpg",
  is_spam: false,
  user: marc,
  tags: [long_term_trade],
)

post_4 = Post.create!(
  content: "In fringilla diam eget felis iaculis, non rutrum nisi ultrices. Vivamus in dapibus justo, ut vestibulum quam. Nulla in purus tincidunt, iaculis leo eget, finibus eros. Donec neque odio, ornare sit amet tellus id, imperdiet tincidunt mauris. Vestibulum vulputate orci id lacus ullamcorper vulputate eu varius libero. Integer fringilla velit nec auctor efficitur. Nunc scelerisque quis enim in imperdiet. Aliquam erat volutpat. Fusce non ligula ligula. In quis est vitae felis scelerisque hendrerit commodo condimentum sapien. Aliquam justo nulla, fermentum id hendrerit quis, tincidunt id risus. Cras sollicitudin, ligula vel sollicitudin gravida, nisi turpis pretium leo, nec cursus elit eros eu eros. Aliquam erat volutpat. Praesent pulvinar mauris vel lobortis aliquam. Suspendisse sagittis lectus nisl, nec viverra nisi convallis at.",
  link: "www.google.com",
  images: "https://itsblockchain.com/wp-content/uploads/2017/06/cryptocurrency.jpg",
  is_spam: false,
  user: sebastian,
  tags: [market_capitalization],
)

post_5 = Post.create!(
  content: "Fusce non ligula ligula. In quis est vitae felis scelerisque hendrerit commodo condimentum sapien. Aliquam justo nulla, fermentum id hendrerit quis, tincidunt id risus. Cras sollicitudin, ligula vel sollicitudin gravida, nisi turpis pretium leo, nec cursus elit eros eu eros. Aliquam erat volutpat. Praesent pulvinar mauris vel lobortis aliquam. Suspendisse sagittis lectus nisl, nec viverra nisi convallis at.",
  link: "www.google.com",
  images: "https://cdn.geekwire.com/wp-content/uploads/2017/07/bigstock-Pixel-Bitcoin-Concept-164015408-630x416.jpg",
  is_spam: false,
  user: fandy,
  tags: [country_regulation],
)

puts "creating trusts..."

trust_1 = Trust.create!(
  source: google,
  user: sebastian,
  screenshot: "http://www.forexnewsnow.com/wp-content/uploads/2017/11/1_oD8k2h_UwRLIOv9-gM1wkg.png",
  link: "www.google.com",
  authenticity: 3,
  post: post_1
)

trust_2 = Trust.create!(
  source: twitter,
  user: marc,
  screenshot: "https://blockgeeks.com/wp-content/uploads/2016/11/infographics03-01-1.png",
  link: "www.google.com",
  authenticity: 1,
  post: post_2
)

trust_3 = Trust.create!(
  source: coinerd,
  user: bruna,
  screenshot: "https://www.hedgethink.com/wp-content/uploads/2015/11/Blockchain-technology-and-cryptocurrency.png",
  link: "www.google.com",
  authenticity: 2,
  post: post_2

)

trust_4 = Trust.create!(
  source: facebook,
  user: adinda,
  screenshot: "https://cdn-images-1.medium.com/max/1920/1*gqGlnvxMVd_yxtZBvI-zZw.png",
  link: "www.google.com",
  authenticity: 4,
  post: post_4

)

puts "creating reports..."

report_1 = Report.create!(
  reason: "This source sucks.",
  user: fandy,
  screenshot: "https://i.ytimg.com/vi/1h2S-1hPs24/maxresdefault.jpg",
  link: "www.google.com",
  authenticity: 2,
  post: post_4
)

report_2 = Report.create!(
  reason: "This user is a hacker.",
  user: sebastian,
  screenshot: "https://i.ytimg.com/vi/lXez-MUjjoY/hqdefault.jpg",
  link: "www.google.com",
  authenticity: 3,
  post: post_4
)

report_3 = Report.create!(
  reason: "This user is a hacker.",
  user: bruna,
  screenshot: "https://i.ytimg.com/vi/QCBJVIdkXXo/hqdefault.jpg",
  link: "www.google.com",
  authenticity: 3,
  post: post_2
)

report_4 = Report.create!(
  reason: "This user is a hacker.",
  user: marc,
  screenshot: "https://i.ytimg.com/vi/07QopZxNWz0/maxresdefault.jpg",
  link: "www.google.com",
  authenticity: 3,
  post: post_1
)
