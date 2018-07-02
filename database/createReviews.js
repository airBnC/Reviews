const fs = require('fs');
const faker = require('faker');
const uuid = require('uuid/v4');

const writeReviews = fs.createWriteStream('seed/reviewComments.csv', {
  flags: 'a',
});

const batch = 100000;
const batches = 1;
// populate 10K different review comments
const reviews = { dates: [], comments: [] };
for (let i = 0; i < 10000; i += 1) {
  reviews.dates.push(JSON.stringify(faker.date.between('2015-01-01', '2018-06-02')).slice(1, 11));
  reviews.comments.push(faker.fake('{{lorem.sentences}}'));
}
// populate 100K different users
const users = {
  id: [],
  first_name: [],
  last_name: [],
  user_name: [],
};
for (let i = 1; i < 100001; i += 1) {
  users.id.push(i);
  users.first_name.push(faker.fake('{{name.firstName}}'));
  users.last_name.push(faker.fake('{{name.lastName}}'));
  users.user_name.push(faker.fake('{{internet.userName}}'));
}

let dataWriter = (writer, data, encoding, callback) => {
  let i = 1;
  function write() {
    let ok = true;
    while (i > 0 && ok) {
      i = i - 1;
      if (i === 0) {
        // lasttime
        writer.write(data, encoding, callback);
      } else {
        // check the writer to see if we should continue
        ok = writer.write(data, encoding);
      }
    }
    if (i > 0) {
      writer.once('drain', write);
    }
  }
  write();
};

// initiate the first line
// initiate the first line
let headers = 'listing_id|user_id|first_name|review_date|review_text|rank_accuracy|rank_communication|rank_cleanliness|rank_location|rank_checkin|rank_value';
dataWriter(writeReviews, headers + '\n', 'utf-8', 1, (err) => {
  if (err) {
    throw err;
  }
});

console.time('reviews');
for (let i = 0; i < batches; i += 1) {
  // generate the data object
  // batch = 100,000;
  // batches = 10; // for testing

  let data = '';
  for (let j = 0; j < batch; j += 1) {
    let idx = Math.floor(Math.random() * 10000); // same number of rows in the reviews object
    let idx2 = Math.floor(Math.random() * 100000);
    let listID = Math.ceil(Math.random() * 10000000); // same number of listing ids 1 indexed
    let userID = users.id[idx2];
    let firstName = users.first_name[idx2];
    let date = reviews.dates[idx];
    let text = reviews.comments[idx];
    let accuracy = Math.ceil(Math.random() * 5);
    let communication = Math.ceil(Math.random() * 5);
    let cleanliness = Math.ceil(Math.random() * 5);
    let location = Math.ceil(Math.random() * 5);
    let checkin = Math.ceil(Math.random() * 5);
    let value = Math.ceil(Math.random() * 5);

    data = data + ID + '|' + listID + '|' + userID + '|' + firstName + '|' + date + '|' + text + '|' + accuracy + '|' + communication + '|' + cleanliness + '|' + location + '|' + checkin + '|' + value + '\n';
  }

  dataWriter(writeReviews, data, 'utf-8', (err) => {
    if (err) {
      throw err;
    } else {
      console.log(`wrote ${i} batches`);
    }
  });
}

writeReviews.on('finish', () => {
  console.log(`wrote ${batch * batches} rows of data to file`);
  console.timeEnd('reviews');
});

// close the stream
writeReviews.end();
