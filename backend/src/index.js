const app = require('./app');
const { connect } = require('./databse');

async function main() {
    // db connectcion
    await connect();
    
    await app.listen(4000);   
    console.log('server on port 4000');
}

main();