Report.destroy_all
Trust.destroy_all
Source.destroy_all
Post.destroy_all
Tag.destroy_all
Profile.destroy_all
User.destroy_all

puts "creating tags..."

political = Tag.create!(name: "Political", description: "Aenean vehicula varius mi.")
analysis = Tag.create!(name: "Analysis", description: "Curabitur sagittis at quam eget mattis.")
news = Tag.create!(name: "News", description: "Fusce convallis turpis.")
technical = Tag.create!(name: "Technical", description: "Nunc tempor ligula elit.")
business = Tag.create!(name: "Business", description: "Fusce convallis turpis.")
random = Tag.create!(name: "Random", description: "Nunc tempor ligula elit.")
social = Tag.create!(name: "Social", description: "Fusce convallis turpis.")

puts "creating users..."

adinda = User.create!(email: "adinda@test.com", password: "a123456")
bruna = User.create!(email: "bruna@test.com", password: "a123456")
marc = User.create!(email: "marc@test.com", password: "a123456")
sebastian = User.create!(email: "sebastian@test.com", password: "a123456")
fandy = User.create!(email: "fandy@test.com", password: "a123456")
john = User.create!(email: "john@test.com", password: "a123456", trustiness: -11, silenced: true)

puts "creating profiles..."

profile_adinda = Profile.create!(user: adinda, nickname: "Ad1nda", first_name: "Adinda", last_name: "Bohte", picture: "https://res.cloudinary.com/abohte/image/upload/v1517830335/IMG_3789b_copy_ygxfyo.jpg")
profile_bruna = Profile.create!(user: bruna, nickname: "Brun4", first_name: "Bruna", picture: "https://res.cloudinary.com/abohte/image/upload/v1517830874/IMG_20180202_171906_danwhd.jpg")
profile_marc = Profile.create!(user: marc, nickname: "PamperBoy")
profile_sebastian = Profile.create!(user: sebastian, nickname: "Sebastian1", picture: "https://res.cloudinary.com/duplhjlsw/image/upload/t_media_lib_thumb/v1518025636/moi5_rkrnqz.jpg")
profile_fandy = Profile.create!(user: fandy, nickname: "Fandy03")
profile_john = Profile.create!(user: john, nickname: "Johnny")


puts "updating trustiness based on profiles..."
adinda.update_trustiness(profile_adinda.first_name_trustiness)
adinda.update_trustiness(profile_adinda.last_name_trustiness)
adinda.update_trustiness(profile_adinda.picture_trustiness)
bruna.update_trustiness(profile_bruna.first_name_trustiness)
bruna.update_trustiness(profile_bruna.picture_trustiness)
sebastian.update_trustiness(profile_sebastian.picture_trustiness)

puts "creating sources..."

google = Source.create!(name: "Google", authenticity: 5, logo: "https://res.cloudinary.com/dyyxiefx5/image/upload/v1517396145/coinmunity-logos/google.png", description: "most used search engine in the world", domain: "google.com", secure_connection: true, verified: true)
twitter = Source.create!(name: "Twitter", authenticity: 3, logo: "https://res.cloudinary.com/dyyxiefx5/image/upload/v1517396145/coinmunity-logos/twitter.svg", description: "online news and social networking service", domain: "twitter.com", secure_connection: true, verified: true)
reddit = Source.create!(name: "Reddit", authenticity: 3, logo: "https://res.cloudinary.com/dyyxiefx5/image/upload/v1517396145/coinmunity-logos/reddit.svg", description: "an American social news aggregation, web content rating, and discussion website", domain: "reddit.com", secure_connection: true, verified: true)
facebook = Source.create!(name: "Facebook", authenticity: 3, logo: "https://res.cloudinary.com/dyyxiefx5/image/upload/v1517396145/coinmunity-logos/facebook.svg", description: "an American online social media and social networking service", domain: "reddit.com", secure_connection: true, verified: true)
coinerd = Source.create!(name: "Coinerd", authenticity: 1, logo: "https://res.cloudinary.com/dyyxiefx5/image/upload/v1517396145/coinmunity-logos/logo.svg", description: "first crypto currencies sharing platform based on trust", domain: "coinerd.org", secure_connection: true, verified: true)

puts "creating posts..."

post_1 = Post.create!(
  content: "The Super Aggregator OnBlockchains.org is my own aggregator. I put it together using Feedly as a river of news from 207 sources, coupled with a WordPress site to publish it. It has 231,00 followers on Feedly, and I continuously update the sources. I did it to scratch my own itch, and made it publicly available. It is very comprehensive, and spits out 200-300 stories per day. If you are a blockchain news junkie, you will get your fix there. It already includes all of the below mentioned sources that have a web page. And you can search a collection of about 200,000 articles on the topic.",
  link: "http://startupmanagement.org/2017/06/06/the-ultimate-reading-list-for-blockchain-token-and-cryptocurrency-sources/",
  images: 'https://tctechcrunch2011.files.wordpress.com/2014/12/a-real-bitcoin.jpg?w=659&zoom=2',
  is_spam: false,
  user: john,
  tags: [political, news],
)

post_2 = Post.create!(
  content: "Sure, fine, maybe it’s a bubble. OK it’s definitely a bubble, but that’s a good thing, a bubble brings attention and investment in infrastructure, which breeds real innovation. Right? Look at the dot-com boom. A lot of people lost a whole lot of paper money, but it brought us a cheap worldwide fiber backbone and companies like Amazon and Google. Today’s crypto bubble is just like that. Right?

…So goes the theory, by which I mean, desperate rationalization. And it was somewhat true, for a while; but not any more. Cryptocurrencies have now ascended to speculative values that actually preclude any non-speculative uses. They have become so expensive that they are preventing innovation.

Most “crypto tokens” are, in fact, just glorified hash values stored on the Ethereum blockchain — literally nothing more than a table of numbers like “address A: 10,000. address B: 20,000,” wrapped in standard blocks of code (the ERC20 and ERC721 standards, for fungible and non-fungible tokens respectively) so that they can be easily transacted.

…Which means that every transfer of such tokens requires a transaction to be performed on the Ethereum blockchain. And as the price of ether has skyrocketed — to more than $1,000 as I write this — transaction fees have done so as well, so that the average fee for an Ethereum transaction is now around US$2.50.

(Ethereum’s variable-gas-price mechanism doesn’t really help; fees are driven by supply and demand. And of course it’s not just Ethereum. Blockstack’s DNS uses the Bitcoin blockchain as its source of truth, and Bitcoin transaction costs have also gone through the roof. SegWit transactions are cheaper / more efficient but that’s noise compared to the overall trend.)

This is fine if you’re just speculating, trading hundreds/thousands of dollars worth of tokens at a time. But it is crippling if you’re actually trying to build an app that people use for anything else.

If you’re trying to build a decentralized name / identity service … your names now cost more than many top-level Internet domains that automatically resolve in browsers. If your tokens represent ownership of virtual entities, or access to decentralized storage … suddenly just using the token at all, never mind transferring the value associated with the tokens, makes your cost structure somewhere between punitive and prohibitive.

So if you’re trying to build anything even remotely high-volume atop an Ethereum token — forget it. Your entire business model is catastrophically doomed at today’s prices. (Ethereum’s “sender-pays” model doesn’t help either, although that’s due to change sometime soonish.) Only very-low-volume, very-high-value applications need apply. Like the current wave of speculation.

As a result, entire categories of cryptocurrency experimentation and innovation are on hold until the bubble bursts, or until / unless Ethereum finds a way to scale such that transaction fees plummet. Oh, people can still write and deploy code. But nobody will use it. Curious would-be users will be repelled by the nontrivial expense of mere experimentation, never mind ongoing usage.

So developers won’t be able to find real-world users, and get any feedback from real-world use; they won’t discover any emergent properties; and nobody will use and then iterate on their work. That whole continent of the blockchain ecosystem is now essentially in a deep freeze, covered by glaciers.

It remains an open question whether even much, much lower fees would be viable in the long run. Proponents of micropayments don’t seem to realize that the fundamental problem with micropayments is not their cost, or the absence of supporting infrastructure; it’s the cognitive load that they induce. Parker Thompson of AngelList argues that fee-free decentralized apps are the only ones which might possibly succeed in consumer markets, and I think he’s right, but that raises the question of how you prioritize and prevent spam blockchain transactions in the absence of fees.

Today that’s a moot point, though. Don’t get me wrong; I’m not saying the sky is falling, the feepocalypse is upon us, and every decentralized application is doomed forevermore. A lot of interesting work and research has in fact been done regarding scaling Ethereum: sharding, Raiden, Plasma. Hopes for them remain justifiably high.

But until and unless they roll out, and/or the cryptocurrency markets stop being voting machines and start being weighing machines, most non-speculative token projects are doomed to indefinite hibernation. If you care about actual innovation, the inevitable popping of today’s bubble won’t mark the onset of crypto winter; rather, it will bring a crypto spring.",
  link: "https://techcrunch.com/2018/01/07/the-cryptocurrency-bubble-is-strangling-innovation/",
  images: "https://steemit-production-imageproxy-upload.s3.amazonaws.com/DQmNgMH9gFniCBx4yXHp3XqVU2hBqGDbFW1c8W44JRBtbij",
  is_spam: false,
  user: bruna,
  tags: [analysis, business, technical],
)

post_3 = Post.create!(
  content: "This sounds like a bad line in a “Planet of the Apes” film, but there’s now a cryptocurrency based on bananas.

It’s called Bananacoin, and was co-founded by entrepreneurs Oleg Dobrovolsky and Alexander Bychkov.

They distribute “tokens” using the Ethereum blockchain, a decentralized data application often used for cryptocurrency.

Every token ― equal in value to the current export price of 1 kilogram of bananas ― is essentially stock in a real organic banana plantation in Laos, where the creators are based. Those bananas are harvested and sold in neighboring China, where the Bananacoin group says the fruit’s demand is larger than the supply.

Bananacoins have been available since their presale in September 2017, but most of the internet heard about them this month thanks to this tweet.",
  link: "https://www.huffingtonpost.com/entry/bananacoin-cryptocurrency_us_5a6b637ce4b01fbbefb16713",
  images: "https://freedman.club/wp-content/uploads/2017/09/bananacoin-ico-freedman-club.jpg",
  is_spam: false,
  user: marc,
  tags: [social, random, news],
)

post_4 = Post.create!(
  content: "So you read the original Cryptocurrency Trading Bible and you jumped head first into the great game?

How are you doing?

Be honest.

Are you making money or losing it?

There’s only one metric in trading. You either win or lose. It’s simple. There is right and wrong and it’s not hazy like real life.

Right is making money. Wrong is losing money.

If you’re losing money and you’re still telling yourself you’re good at trading you’re straight up lying to yourself.


You were up 100% but gave it all back four weeks later? Then you failed. Simple as that.

But don’t worry. I’ve been there. Everyone has. Nobody is immune.

These are hard lessons but there is only one way to learn them:

By making the mistakes yourself.",
  link: "https://hackernoon.com/the-cryptocurrency-trading-bible-two-the-seven-deadly-sins-of-technical-analysis-cacd04f916b3",
  images: "https://cdn-images-1.medium.com/max/2000/1*4wa2QxJArm95AR6BOs-LvA.jpeg",
  is_spam: false,
  user: sebastian,
  tags: [technical, analysis],
)

post_5 = Post.create!(
  content: "Most readers have probably heard of Bitcoin, the digital coin that dominates the cryptocurrency market. It has gained notice both because of its skyrocketing value (from less than a cent in early 2010 to around $2,600 currently) and because it is frequently a key player in hacking- and black-market-related stories, from the looting of nearly half a billion dollars in coins from the Mt. Gox exchange in 2014 to the recent demand for payment in Bitcoin in the WannaCry ransomware attack. (For the uninitiated, here is a useful primer on Bitcoin.)

But do you know Ethereum, with a total value of coins in circulation of close to $20 billion? Bitcoin Cash, which split off from the original Bitcoin on Aug. 1, lost about half its value within hours, then nearly quadrupled by the next day? Or, rounding out the Big Four, Ripple — whose currency is known as XRP — which shot up to about 40 cents by mid-May from less than a cent at the end of March? (Full disclosure: I owned but unloaded three of these currencies before writing this article.) Then there are over 800 lower-value and often creatively named coins among those listed on Coinmarketcap.com. One can buy FedoraCoin (its jaunty symbol being the Justin Timberlake-approved hat), CannabisCoin (one guess what it looks like) or, to choose one of many bringing up the rear, Quartz, currently priced around three-thousandths of a cent. (Bad news for those who bought it at just under $2 at the end of May.)

After years as a niche market for technologically sophisticated anarchists and libertarians excited about a decentralized financial network not under government control, digital coins may be on the verge of going mainstream. “It’s the wild, wild West,” said Ron Ginn, 35, founder of a private photo-sharing service called Text Event Pics in St. Augustine, Fla., who has taken all his money out of the stock market and put it into Ripple and real estate. “This is like getting to invest in the internet in the ’90s. I’m obviously very bullish, but I expect to make a couple million dollars off very little money. This is the opportunity of a lifetime. Finance is getting its internet.”",
  link: "https://www.nytimes.com/2017/08/03/style/what-is-cryptocurrency.html",
  images: "https://cdn.geekwire.com/wp-content/uploads/2017/07/bigstock-Pixel-Bitcoin-Concept-164015408-630x416.jpg",
  is_spam: false,
  user: fandy,
  tags: [random, political, business],
)

post_6 = Post.create!(
  content: "Want to get rich enough to fill bathtubs with dollar bills just for kicks? Could Bitcoin make that happen? Let's dive in.

When Bitcoin debuted in 2009, its early adopters bought up large amounts of the digital currency for pennies. Since then, Bitcoin’s value has increased dramatically, turning several of those initial investors into millionaires. But the economics surrounding Bitcoin and other forms of digital currency like Ethereum, Ripple, Litecoin, and most recently, Bitcoin Cash, all dubbed “cryptocurrency,” can be unpredictable and complicated.

One huge benefit to using cryptocurrency is that it can't be stolen or counterfeit. When digital currencies are exchanged, they're converted into illegible code that not only makes them secure but also makes the sender and receiver appear anonymous. Unlike normal currency, digital currencies are not government regulated. No high bank fees, no fluctuations based on government regulations, and no corrupt bank antics. Sounds pretty nice, right?

Unfortunately, with decentralization comes instability, and cryptocurrencies are known for being highly volatile and unpredictable. Like most high-risk investments, this leaves opportunity for reaching ridiculous levels of wealth (meaning you can finally blow your nose in hundred dollar bills).

For the average person to achieve success in cryptocurrency marketplaces, he or she will need to get learning. That’s where the Beginner’s Guide to Cryptocurrency Investing comes in. It will give you all the knowledge you’ll need to make smart choices and turn your physical cash into a sizable digital stash.

Over the course of 27 lectures and 2.5 hours of content, this program will teach you methods for investing in altcoins, how to maximize your return, and how to convert those coins back into real money. You’ll learn about the various cryptocurrencies available and which is right for you and you'll dive into the digital currency community, gathering valuable research and insights along the way. Finally, you’ll be able to estimate the true value of the entire market and decide where and when to make your move.

Now is the time to make your digital fortune. Pick up the Beginner’s Guide to Cryptocurrency Investing for $15, an incredible reduction from the regular $180 price.",
  link: "https://mashable.com/2017/08/14/what-is-bitcoin-and-how-to-make-money-with-it/#zzoO0J3gvaqw",
  is_spam: false,
  user: bruna,
  tags: [social, random, news],
)

post_7 = Post.create!(
  content: "In a hearing today before the Senate Banking Committee, Securities and Exchange Commission Chairman Jay Clayton and Commodity Futures Trading Commission Chairman Christopher Giancarlo opened up about what the near-term U.S. regulatory fate of cryptocurrency might look like. In a week of plunging prices and bad news, the hearing struck a tone that coin watchers could reasonably interpret as surprisingly optimistic.

Over the course of the open hearing, Clayton and Giancarlo traded testimony over what can be regulated, what should be regulated and how, while offering a broader outlook on the long-term future of virtual currency markets and blockchain tech.

The testimony drew a useful distinction among three pillars of the virtual currency ecosystem (for lack of a better unifying term): cryptocurrencies, “a replacement for dollars;” ICOs, “like a stock offering;” and distributed ledger technologies, or the technical framework generally known as blockchain.

Throughout the hearing, on the SEC side, Clayton struck a relatively solemn tone focused on ICO fraud concerns, while the CFTC’s Giancarlo came across as genuinely enthusiastic and curious about the emerging market.",

  link: "https://techcrunch.com/2018/02/06/virtual-currencies-oversight-hearing-sec-cftc-bitcoin/",
  images: 'https://tctechcrunch2011.files.wordpress.com/2018/02/gettyimages-914923306.jpg?w=659&zoom=2',
  is_spam: false,
  user: adinda,
  tags: [political, news],
)

puts "summarizing posts..."
post_1.summary = post_1.summarize
post_1.save
post_2.summary = post_2.summarize
post_2.save
post_3.summary = post_3.summarize
post_3.save
post_4.summary = post_4.summarize
post_4.save
post_5.summary = post_5.summarize
post_5.save
post_6.summary = post_6.summarize
post_6.save
post_7.summary = post_7.summarize
post_7.save

puts "creating trusts..."

trust_1 = Trust.create!(
  source: coinerd,
  user: sebastian,
  comment: "Great indept analysis!",
  screenshot: "http://www.forexnewsnow.com/wp-content/uploads/2017/11/1_oD8k2h_UwRLIOv9-gM1wkg.png",
  link: "www.google.com",
  post: post_7
)

trust_2 = Trust.create!(
  source: twitter,
  user: marc,
  comment: "Hilarious and true.",
  screenshot: "https://blockgeeks.com/wp-content/uploads/2016/11/infographics03-01-1.png",
  link: "www.google.com",
  post: post_2
)

trust_3 = Trust.create!(
  source: google,
  user: bruna,
  comment: "Very nice, new way to look at things.",
  screenshot: "https://www.hedgethink.com/wp-content/uploads/2015/11/Blockchain-technology-and-cryptocurrency.png",
  link: "www.google.com",
  post: post_4
)

trust_4 = Trust.create!(
  source: facebook,
  user: adinda,
  comment: "Great insight!",
  screenshot: "https://cdn-images-1.medium.com/max/1920/1*gqGlnvxMVd_yxtZBvI-zZw.png",
  link: "www.google.com",
  post: post_4
)

puts "updating trustiness based on trusts..."
trust_1.post.user.update_trustiness(trust_1.trust_trustiness)
trust_2.post.user.update_trustiness(trust_2.trust_trustiness)
trust_3.post.user.update_trustiness(trust_3.trust_trustiness)
trust_4.post.user.update_trustiness(trust_4.trust_trustiness)

puts "creating reports..."

report_1 = Report.create!(
  reason: "This source sucks.",
  user: fandy,
  screenshot: "https://i.ytimg.com/vi/1h2S-1hPs24/maxresdefault.jpg",
  link: "www.google.com",
  post: post_3
)

report_2 = Report.create!(
  reason: "This user is a hacker.",
  user: sebastian,
  screenshot: "https://i.ytimg.com/vi/lXez-MUjjoY/hqdefault.jpg",
  link: "www.google.com",
  post: post_3
)

report_3 = Report.create!(
  reason: "This user is a hacker.",
  user: bruna,
  screenshot: "https://i.ytimg.com/vi/QCBJVIdkXXo/hqdefault.jpg",
  link: "www.google.com",
  post: post_2
)

report_4 = Report.create!(
  reason: "This source is invalid.",
  user: marc,
  screenshot: "https://i.ytimg.com/vi/07QopZxNWz0/maxresdefault.jpg",
  link: "www.google.com",
  post: post_5
)

puts "updating trustiness based on trusts..."
report_1.post.user.update_trustiness(report_1.report_trustiness)
report_2.post.user.update_trustiness(report_2.report_trustiness)
report_3.post.user.update_trustiness(report_3.report_trustiness)
report_4.post.user.update_trustiness(report_4.report_trustiness)

puts "creating comments..."

comment_1 = Comment.create!(
  text: "Insightful stuff, keep up the posts!",
  user: bruna,
  post: post_7
)

comment_2 = Comment.create!(
  text: "Made me speechless",
  user: fandy,
  post: post_6
)

comment_3 = Comment.create!(
  text: "Utter garbage, I can never get back the minutes I spent reading this post and commenting on it :(",
  user: marc,
  post: post_1
)

comment_4 = Comment.create!(
  text: "Got me thinking, not in a good way",
  user: fandy,
  post: post_3
)

comment_5 = Comment.create!(
  text: "Really nice, love to read more of your thoughts",
  user: adinda,
  post: post_2
)

comment_6 = Comment.create!(
  text: "Stupid",
  user: john,
  post: post_2
)
