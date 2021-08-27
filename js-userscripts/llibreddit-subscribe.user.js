const path = new URL(window.location.href).pathname;
const subs = path.slice(3, path.length).split('+');

const run = async () => {
  let task_complete = true;

  subs.forEach(async sub => {
    while (true) {
      if (task_complete == true) {
        task_complete = false;
        let resp = await subscribe(sub);
        console.log(`${sub}: ${resp.status}`);
        task_complete = true;
        brek;
      }
    }
  });
};

const subscribe = async sub => {
  return await fetch(`https://libreddit.batsense.net/r/${sub}/subscribe`, {
    credentials: 'include',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    method: 'POST',
    mode: 'cors',
  });
};
