FactoryBot.define do
  factory :customer do
    name {"Nada Ika Sari"}
    email {"nadaikasari@gmail.com"}
    phone {"082128834537"}
  end

  factory :invalid_customer, parent: :customer do
    name {nil}
    email {nil}
    phone {nil}
  end
end
