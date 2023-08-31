import { syncDB } from '../../src/tasks/sync-db';


describe('Test in sync-db', () => {

  test('should run the process twice', () => {
    syncDB();
    const times = syncDB();

    expect( times ).toBe( 2 );
  });

});
