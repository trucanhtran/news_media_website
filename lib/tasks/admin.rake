namespace :admin do

  desc "create admin"
  task create: :environment do
    User.create(name: "Trúc Anh", email: "anhttt18411@st.uel.edu.vn", password: "123456", is_admin: true)
  end
end
