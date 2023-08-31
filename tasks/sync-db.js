
let times = 0;

export const syncDB = () => {
  times++;
  console.log('tick every 5 seconds --> ', times);

  return times;
};
