const fs = require('fs');
const faker = require('faker');

// Users
const generateUsers = () => {
  let usersToWrite = '';
  for (let i = 0; i < 600; i += 1) {
    usersToWrite += faker.fake('\\N	{{name.firstName}}	{{name.lastName}} \n');
  }
  try {
    fs.appendFileSync('./database/data/userdata.txt', usersToWrite);
  } catch (err) {
    console.log('oops!');
  }
};

// Reviews
const generateReviews = () => {
  let reviewsToWrite = '';
  for (let i = 0; i < 1800; i += 1) {
    const listID = Math.ceil(Math.random() * 100);
    const userID = Math.ceil(Math.random() * 600);
    const date = JSON.stringify(faker.date.between('2015-01-01', '2018-06-02')).slice(1, 11);
    const text = faker.fake('{{lorem.sentences}}');
    const accuracy = Math.ceil(Math.random() * 5);
    const communication = Math.ceil(Math.random() * 5);
    const cleanliness = Math.ceil(Math.random() * 5);
    const location = Math.ceil(Math.random() * 5);
    const checkin = Math.ceil(Math.random() * 5);
    const value = Math.ceil(Math.random() * 5);

    const finalString = `\\N	${listID}	${userID}	${date}	${text}	${accuracy}	${communication}	${cleanliness}	${location}	${checkin}	${value} \n`;
    reviewsToWrite += finalString;
  }
  try {
    fs.appendFileSync('./database/data/reviewdata2.txt', reviewsToWrite);
  } catch (err) {
    console.log('oops!');
  }
};

//generateUsers();
//generateReviews();
