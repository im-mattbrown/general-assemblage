USERS = [
  {
    first_name: "Switt",
    last_name: "Switt",
    email: "switt@yahoo.com",
    user_name: "Switter",
    image_url: "http://www.naijaloaded.com.ng/wp-content/uploads/2014/06/YOUNG-SWITT.jpg",
    course_taken: "WDI",
    city: "Chicago",
    password_digest: "$2a$10$NgAP4WW978uoGdgmkZ9xqeS0bUAm9We9TfylhUNP016BAE276znA2" #pw switt
  },
  {
    first_name: "Aaron",
    last_name: "Ray",
    email: "ray@ray.com",
    user_name: "aaronray",
    image_url: "http://mediaweb.actionnewsjax.com/photo/2014/09/07/MUG_1_AARON_RAY_1702963_ver1.0_640_360.jpg",
    course_taken: "WDI",
    city: "San Francisco",
    password_digest: "$2a$10$pmrsWBDkh2dkU5U2by3kFuKFV669TCcwzAnrfgLKCu5VfhAoIgGk2" #pw ray
  },
  {
    first_name: "Ron",
    last_name: "Kuby",
    email: "ronkuby@gmail.com",
    user_name: "RonK",
    image_url: "http://www.azquotes.com/public/pictures/authors/94/b0/94b062474e353dc9a1ab872ed5d1a4d3/548f82d339cf3_ron_kuby.jpg",
    course_taken: "Web Development Immersive",
    city: "Los Angeles",
    password_digest: "$2a$10$M/XASWbMr2R1rkaLxO8g7OowCHKhvsRzSxO9p.B./m.rcUHV5NV/K" #pw ray
  },

]

ARTICLES = [
  {
    title: "Hi I'm Switt",
    content: "SWITTT SWITT SWITT",
    city: "Chicago",
    article_type: "Off Topic",
    user_id: 1
  },
  {
    title: "Javascript Developer Needed",
    content: "I finished UXDI recently in Austin and am looking for a JavaScript developer to code up my mobile food delivery app.",
    city: "Austin",
    article_type: "Help Wanted",
    user_id: 1
  },
  {
    title: "Looking for a project using React",
    content: "Anyone have a project they need help with. Would like to learn how to use React for the front end of a rails app.",
    city: "San Francisco",
    article_type: "Help Wanted",
    user_id: 2
  },
]

COMMENTS = [
  {
    content: "Ok?",
    user_id: 1,
    article_id: 1
  }
]


User.create(USERS)
Article.create(ARTICLES)
Comment.create(COMMENTS)

p "#{User.count} users created!"
