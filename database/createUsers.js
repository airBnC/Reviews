const fs = require('fs');
const faker = require('faker');

const writeUsers = fs.createWriteStream('seed/users.csv', {
  flags: 'a',
});

const batch = 10000;
const batches = 1;
// populate 10K different review comments
const users = { first_name: [], last_name: [], user_name: [] };
for (let i = 0; i < 10000; i += 1) {
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
let headers = 'first_name|last_name|user_name';
dataWriter(writeUsers, headers + '\n', 'utf-8', 1, (err) => {
  if (err) {
    throw err;
  }
});

console.time('users');
for (let i = 0; i < batches; i += 1) {
  // generate the data object
  // batch = 100,000;
  // batches = 10; // for testing

  let data = '';
  for (let j = 0; j < batch; j += 1) {
    let idx = Math.floor(Math.random() * 10000); // same number of rows in the reviews object
    let first_name = users.first_name[idx];
    let last_name = users.last_name[idx];
    let user_name = users.user_name[idx];

    data = data + first_name + '|' + last_name + '|' + user_name + '\n';
  }

  dataWriter(writeUsers, data, 'utf-8', (err) => {
    if (err) {
      throw err;
    } else {
      console.log(`wrote ${i} batches`);
    }
  });
}

writeUsers.on('finish', () => {
  console.log(`wrote ${batch * batches} rows of data to file`);
});

// close the stream
writeUsers.end();
console.timeEnd('users');
