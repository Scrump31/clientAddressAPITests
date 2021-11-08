function fn() {
  var fakerClass = Java.type('com.github.javafaker.Faker');
  var faker = new fakerClass();
  var fakeUser = {
    name: faker.name().fullName(),
    email: faker.internet().emailAddress(),
    phone: parseInt(faker.number().digits(10), 10),
    address: faker.address().fullAddress(),
    company: faker.company().name(),
    notes: faker.company().catchPhrase(),
  };

  var config = {
    baseUrl: 'http://localhost:3000/api/',
    fakeUser: fakeUser,
  };
  return config;
}
