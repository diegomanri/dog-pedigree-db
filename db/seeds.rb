Dog.create!([
  {dname: "Doge", breed: "Shibe", variety: "Aggressive", dob: "2015-01-01", height: "5", weight: "400", pedinum: "123123", occupation: "Rescue", workcert: "123", health: "Bretty good", dcomments: "Just your friendly neighborhood doge.", avatar: "1427728385115.png", user_id: 16, avatar_url: "http://i.imgur.com/7CL5wIC.jpg", sex: nil},
  {dname: "d2", breed: "d", variety: "d", dob: "2015-10-09", height: "", weight: "", pedinum: "", occupation: "", workcert: "", health: "", dcomments: "", avatar: "1440605729794.jpg", user_id: 15, avatar_url: "/uploads/dog/avatar/2/1440605729794.jpg", sex: nil},
  {dname: "Imod Dog", breed: "Schnauzer", variety: "Short-hair", dob: "2009-10-13", height: "5\"5'", weight: "", pedinum: "", occupation: "", workcert: "", health: "", dcomments: "", avatar: "1427213670831.jpg", user_id: 16, avatar_url: "http://i.imgur.com/7CL5wIC.jpg", sex: nil}
])
Event.create!([
  {ename: "Thomas Birthday Party", edate: nil, etime: "2000-01-01 17:00:00", edescription: "Celebrating the birth of the best cat in the planet.", estateprov: "TX", ecity: "Richmond", ezippostal: "77407", ecountry: "USA", time_zone: "CDT", avatar: "1355427840832.jpg", avatar_url: nil, creator_id: nil},
  {ename: "Test Evt", edate: "2015-11-25", etime: "2000-01-01 01:37:00", edescription: "Test", estateprov: "", ecity: "", ezippostal: "", ecountry: "", time_zone: nil, avatar: nil, avatar_url: nil, creator_id: 16},
  {ename: "Thomas Birthday After Party3", edate: "2016-01-05", etime: "2000-01-01 04:00:00", edescription: "Early morning fun", estateprov: "TX-Texas", ecity: "Richmond", ezippostal: "77407", ecountry: "United States", time_zone: nil, avatar: "1440x900sss.jpg", avatar_url: nil, creator_id: 15},
  {ename: "Thomas Birthday After Party2", edate: "2016-10-28", etime: "2000-01-01 10:02:00", edescription: "Just one is not enough", estateprov: "", ecity: "", ezippostal: "", ecountry: "", time_zone: nil, avatar: "eIvFD.jpg", avatar_url: nil, creator_id: 16}
])
User.create!([
  {ufname: "dog", umname: "dog", ulname: "dog", uemail: "dog@testingdoggi.cxx", username: "test", password_digest: "$2a$10$8IG0foenMa9gzhQOXdgv5uf/FYhk74k0ojbt7mQm34P3Y2LM.eOwG", email_confirmed: false, confirm_token: nil, role: nil, reset_digest: nil, reset_set_at: nil, city: nil, state: nil, zip: nil},
  {ufname: "Diego", umname: "Admin", ulname: "Manrique", uemail: "diegomanri@gmail.com", username: "dmanriqu", password_digest: "$2a$10$Lc9cKV/44KjbzHKnqHLhsunotykbboq3.4nlj9AGf/LTWtklOeQ3i", email_confirmed: true, confirm_token: nil, role: 1, reset_digest: nil, reset_set_at: nil, city: nil, state: nil, zip: nil},
  {ufname: "reg", umname: "m", ulname: "user", uemail: "imod4you@gmail.com", username: "imod4you", password_digest: "$2a$10$cq9oyDc.lZSJZEyG1dzyQuYwdK3CfFvmSNBXQFVyOTS5br/qZVZry", email_confirmed: true, confirm_token: nil, role: 0, reset_digest: "$2a$10$R21/j71BSGWihsA726WM/uRCJ5pv10UzYOpVUXejCia6qgqU.B5Ue", reset_set_at: "2015-10-04 02:32:29", city: nil, state: nil, zip: nil},
  {ufname: "test", umname: "", ulname: "", uemail: "foreveralone@test.cxx", username: "test1", password_digest: "$2a$10$DEGkuqLGPuIkG.sn.EZAVuY7qSS6T7GR5i0V3/0mcov1j.8cSxq8m", email_confirmed: false, confirm_token: "gjn9fHcfXw7ElPhnkny9rA", role: 0, reset_digest: nil, reset_set_at: nil, city: "", state: nil, zip: ""},
  {ufname: "test2", umname: "", ulname: "testte", uemail: "foreveralone2@test.cxx", username: "test2", password_digest: "$2a$10$VBuOlGdbR1R5nsBoqzm59OFWP2qwK7v.WJ.o.Slv2yPf4wNsrcf.6", email_confirmed: false, confirm_token: "CuI00ebX4NbVAYmdIT_p8Q", role: 0, reset_digest: nil, reset_set_at: nil, city: "", state: nil, zip: ""},
  {ufname: "test3", umname: "", ulname: "", uemail: "test12a@testingalways.cxx", username: "test3", password_digest: "$2a$10$gihYWkljw28Z3sFTMPY4iungDzUoWOdKAG0Wu011izrzmPZBlpK6a", email_confirmed: false, confirm_token: "2DEUpBLHWAUhRzkgYkWFYw", role: 0, reset_digest: nil, reset_set_at: nil, city: "", state: nil, zip: ""}
])
