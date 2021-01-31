# docker-fittrackee

Docker sample to install FitTrackee

---

[FitTrackee](https://samr1.github.io/FitTrackee/) is a self-hostable application, allowing you to track your outdoor activities (workouts) from gpx files and keep your data on your own server.

- To install **FitTrackee** with database initialisation and run the application and dramatiq workers:

```shell
  $ git clone https://github.com/SamR1/docker-fittrackee.git
  $ cd docker-fittrackee
  $ $EDITOR db/create.sql  # update fittrackee password
  $ cp .env.example .env
  $ $EDITOR .env  # update environment variables (see Documentation)
  $ make build run init
```

Open http://localhost:5000, log in as admin (the email is `admin@example.com` and the password `mpwoadmin`) and update password.

- To stop **Fittrackee**:

```bash
    $ make stop
```

- To start **Fittrackee** (application and dramatiq workers):

```bash
    $ make run-all
```

- To run shell inside **Fittrackee** container:

```bash
    $ make shell
```

- To update **FitTrackee**

```bash
    $ make migrate update
```
