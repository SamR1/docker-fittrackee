# docker-fittrackee

Docker sample to install FitTrackee

---

[FitTrackee](https://samr1.github.io/FitTrackee/) is a self-hosted application, allowing you to track your outdoor activities (workouts) from gpx files and keep your data on your own server.

- To install **FitTrackee** with database initialisation and run the application and dramatiq workers:

```shell
  $ git clone https://github.com/SamR1/docker-fittrackee.git
  $ cd docker-fittrackee
  $ $EDITOR db/create.sql  # update fittrackee user password
  $ cp .env.example .env
  $ mkdir [FITTRACKEE_LOG_DIR]  # create a directory to store fittrackee logs
  $ $EDITOR .env  # update environment variables (see Documentation)
  $ make build run init
```

Open http://localhost:5000 and register.

- To set admin rights to the newly created account, use the following command:
  **Note**: it also activates account.

```bash
   $ make set-admin USERNAME=<username>
```

- To stop **Fittrackee**:

```bash
    $ make stop
```

- To start **Fittrackee**:

```bash
    $ make run
```

- To start **Fittrackee** application and dramatiq workers (with Redis):

```bash
    $ make run-all
```

  **Warning**: `EMAIL_URL` must be initialized to send emails.

- To update **FitTrackee**

```bash
    $ make update migrate 
```

- To run shell inside **Fittrackee** container (with virtualenv):

```bash
    $ make shell
```


Notes:
- **Important**: all uncommented variables present in .env must be initialized. Otherwise, the application may not start.
- If you just want to evaluate **FitTrackee**, ready to use docker files are available in **FitTrackee** repository (see [Documentation](https://samr1.github.io/FitTrackee/installation.html#docker)).
