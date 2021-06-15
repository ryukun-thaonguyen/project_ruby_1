5.times do |n|
  User.create('name'=>Faker::Name.name,'email'=>"supervisor-#{n+1}@gmail.com",'role'=>true,
  'password'=>"123456",'password_confirmation'=>"123456")
end

5.times do |n|
    User.create('name'=>Faker::Name.name,'email'=>"trainee-#{n+1}@gmail.com",'role'=>false,
      'password'=>"123456",'password_confirmation'=>"123456")
end

10.times do |n|
  Course.create(
    'name'=>Faker::Name.name, 
    'description'=>"rorem ipsum dolor sit amet, consectetur adipisicing elit, seddo eiusmod tempor", 
    'start_date'=>Faker::Date.between(from: '2021-05-23', to: '2021-06-25'), 
    'end_date'=>Faker::Date, 
    'status'=>false, 
    'user_id'=>1
  )
end