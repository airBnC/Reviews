const faker = require('faker');

// Example:
// var x = faker.fake('{{name.firstName}}', '{{name.lastName}}', '{{name.lastName}}');

// Users
for (let i = 0; i < 600; i += 1) {
  console.log(faker.fake('\\N	{{name.firstName}}	{{name.lastName}}'));
}

// Reviews
for (let i = 0; i < 1800; i += 1) {
  let listID = Math.ceil(Math.random() * 100);
  let userID = Math.ceil(Math.random() * 600);
  let date = JSON.stringify(faker.date.between('2015-01-01', '2018-06-02')).slice(1, 11);
  let text = faker.fake('{{lorem.sentences}}');
  let accuracy = Math.ceil(Math.random() * 5);
  let communication = Math.ceil(Math.random() * 5);
  let cleanliness = Math.ceil(Math.random() * 5);
  let location = Math.ceil(Math.random() * 5);
  let checkin = Math.ceil(Math.random() * 5);
  let value = Math.ceil(Math.random() * 5);

  let finalString = `\\N	${listID}	${userID}	${date}	${text}	${accuracy}	${communication}	${cleanliness}	${location}	${checkin}	${value}`;

  console.log(finalString);
}

// need a data loader to batch up the records and then send the write query to the db...JS will probably be able to load the data faster than the BD
// so how to handle this, using AWAIT? which will slow it down a lot...need to run about 
