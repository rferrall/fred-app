User.create!([
  {name: "Georgia ", email: "georgia@gmail.com", image: "https://images.unsplash.com/photo-1472698938026-79bed881e5b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", password_digest: "$2a$10$xNzTm24i37U9RfqmZp5GgeTl8IjTpKff0SyLOgLe.8TUeDdvBDUQu", phone_number: "+17632422868"},
  {name: "montana", email: "montana@gmail.com", image: "https://images.pexels.com/photos/531767/pexels-photo-531767.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", password_digest: "$2a$10$geJKJoDD3YnGsO.O.sXbR.U07qkPIx9CDtQwxVO822yK2FSzCpbzm", phone_number: "+17632422868"},
  {name: "california", email: "california@gmail.com", image: "https://images.pexels.com/photos/386025/pexels-photo-386025.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", password_digest: "$2a$10$0lXUw5Q5J12OsL6S8TZnkOfiCh1JzRCEStDMHbQcDv1YZGVHF87wq", phone_number: "+18053002432"},
  {name: "Utah", email: "utah@gmail.com", image: "https://images.pexels.com/photos/38012/pexels-photo-38012.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", password_digest: "$2a$10$DWo1v15rBSAISdA2DVBvoujl2CcI12JU8Hp/hJiuRCCHDmiaAJwxu", phone_number: "+17632422868"}
])


Goal.create!([
  {user_id: 1, end_date: "2019-05-15 00:00:00", frequency: "weekly", goal: "I've been painting the same old things day in and day out. I'd like to find a new inspiration and maybe get outside a bit more. A walk a day. At least 30 minutes. to new places. Help keep me on track.", subject: "The great outdoors", active: true},
  {user_id: 2, end_date: "2019-04-30 00:00:00", frequency: "twice a week", goal: "I spend way to much time on my phone. I would like to fill my time with more 'active' pursuits instead of wasting time scrolling on my phone. particularly before bed when I could be reading or meditating. check in on me? give me some ideas? no more apps please!", subject: "put the phone down", active: true},
  {user_id: 4, end_date: "2019-04-30 00:00:00", frequency: "weekly", goal: "i just need a reminder to take better care of myself. vitamins, water, exercise the whole she-bang. i keep thinking that i don't have time for it...but in fact I need it.", subject: "Sefl-care", active: true},
  {user_id: 3, end_date: "2019-06-16 00:00:00", frequency: "weekly", goal: "I want to travel more. my family just doesn't understand and they get really negative or fearful about me traveling. I'd like to plan a trip - whether or not I find anyone to go with me. some positive words would be great as I gather my courage to do this.", subject: "itchy feet for travel", active: false},
  {user_id: 3, end_date: "2019-05-15 00:00:00", frequency: "twice a week", goal: "I just lost my job so my travel plans will need to be on hold. I have to find a new gig. can you help me keep my hopes up through this hellish process. Maybe 5 applications per day?", subject: "workworkworkworkwork", active: true}
])


Conversation.create!([
  {sender_id: 1, recipient_id: 2},
  {sender_id: 3, recipient_id: 1},
  {sender_id: 4, recipient_id: 1},
  {sender_id: 3, recipient_id: 2}
])

Message.create!([
  {user_id: 1, conversation_id: 1, body: "hi Montana. i know what you mean and I think that is a great goal.what have you tried so far? I'm going to try to get outside more. starting with a nightly walk after dinner.i've also joined a couple of groups on facebook to get more active into local hikes and learn from others in the area. I'm about to head off for my walk now. have a great evening!"},
  {user_id: 3, conversation_id: 2, body: "Hi georgia,\n\nI hope this message finds you doing well and getting outside more. I know I'm spoiled here in california with some nice weather all year round. i especially like trying new parks out, but I know it can be weird to hop in the car to go for a walk when you could just...walk.\ni saw a cool thing once to do with children though and it might help with the inspiration part of your walks...they said to treat it like an ISPy game or a 'hunt'. so 3 green things, 2 smelly things, etc. The other thing you could try is to pick up trash or recycling on your walks. might give you a purpose and help you stay committed to it.\n\nI joined some facebook groups today about solo woman travel. and i'm so impressed by them. I'm trying to scour through them and see what might be a good place for a first trip.\n\nhave a great night!\n\nCali"}
])

