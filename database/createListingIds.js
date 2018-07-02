const fs = require('fs');
const faker = require('faker');

const writeListings = fs.createWriteStream('seed/listingIds.csv', {
  flags: 'a',
});

const batch = 100000;
const batches = 100;
// populate 10K different names
const names = [];
for (let i = 0; i < 1000; i += 1) {
  names.push(faker.fake('{{random.words}}'));
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
let name = faker.fake('listing_name');
dataWriter(writeListings, name + '\n', 'utf-8', 1, (err) => {
  if (err) {
    throw err;
  }
});

console.time('listings');
for (let i = 0; i < batches; i += 1) {
  let data = '';
  for (let j = 0; j < batch; j += 1) {
    let idx = Math.floor(Math.random() * 1000);
    name = names[idx];
    data = data + name + '\n';
  }

  dataWriter(writeListings, data, 'utf-8', (err) => {
    if (err) {
      throw err;
    }
  });
}
console.timeEnd('listings');


// for (let i = 0; i < batches; i += 1) {
//   const writeListings = fs.createWriteStream('listingIds.csv', {
//     flags: 'a',
//   });
//   console.time('listingIds');
//   for (let j = 0; j < batch; j += 1) {
//     var ok = writeListings.write(string);

//     if(!ok) {
//       writeListings.once('drain', )
//     }
//   }
//   writeListings.on('finish', () => {
//     console.log(`wrote ${i} batches`);
//   });

//   writeListings.end();
// }

// for (let i = 0; i < batch; i += 1) {
//   const writeListings = fs.createWriteStream('listingIds.csv', {
//     flags: 'a',
//   });
//   console.time('listingIds');
//   for (let j = 0; j < x / batches; j += 1) {
//     const idx = Math.floor(Math.random() * 1000);
//     name = names[idx];
//     const string = name + '\n';
//     writeListings.write(string);
//   }
//   writeListings.on('finish', () => {
//     console.log(`wrote ${i} batches`);
//   });

//   writeListings.end();
// }
// // the finish event is emitted when all data has been flushed from the stream
// writeListings.on('finish', () => {
//   console.timeEnd('listingIds');
//   console.log(`wrote ${x} rows of data to file`);
// });

// // close the stream
// writeListings.end();
