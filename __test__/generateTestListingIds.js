const fs = require('fs');
const faker = require('faker');
const uuid = require('cassandra-driver').types.Uuid;
const output = 'listingIds.csv';

if(fs.existsSync(output)) {
  fs.unlinkSync(output); //delete the file if exists
}
const writeReviews = fs.createWriteStream(output, {
  flags: 'a',
});

let batch = 10000;
let batches = 1; // batch * batches should not exceed 10K records
let seed = Math.floor(Math.random() * 49990000) //seed generates a random starting point

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


//add the header
dataWriter(writeReviews, 'ids\n', 'utf-8', (err, results) => {
  if (err) {
    console.log('error in write', err)
  }
});

// create the id's to pass to the writer
let ids = seed;
for (let i = 0; i < batches; i += 1) {
  let data = '';
  for (let j = 0; j < batch; j += 1) {
     ids += 1;
     data = data + ids + '\n';
  };
  dataWriter(writeReviews, data, 'utf-8', (err, results) => {
    if (err) {
      console.log('error in write', err)
    }
  });
}
  

