import { schedule } from 'node-cron';
import { syncDB } from './tasks/sync-db.js';


console.log("Start app");

schedule('*/5 * * * * *', syncDB );
