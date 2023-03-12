# docker-fittrackee

Docker sample to install FitTrackee

---

[FitTrackee](https://samr1.github.io/FitTrackee/) is a self-hosted application, allowing you to track your outdoor activities (workouts) from gpx files and keep your data on your own server.

- To install **FitTrackee** with database initialisation and run the application:

```shell
  $ git clone https://github.com/SamR1/docker-fittrackee.git
  $ cd docker-fittrackee
  $ $EDITOR db/create.sql  # update fittrackee user password
  $ cp .env.example .env
  $ mkdir [FITTRACKEE_LOG_DIR]  # create a directory to store fittrackee logs
  $ $EDITOR .env  # update environment variables (see Documentation)
  $ make build up init
```

With default configuration (no `EMAIL_URL` set), email sending is disabled.

- Open http://localhost:5000 and register.

- To set admin rights to the newly created account, use the following command:
  **Note**: it also activates account.

```bash
   $ make set-admin USERNAME=<username>
```

- To stop docker containers:

```bash
    $ make stop
```

- To start docker containers:

```bash
    $ make up
```

- To start **Fittrackee** application:

```bash
    $ make run
```

- To start **Fittrackee** application and dramatiq workers (with Redis) in order to send emails:

```bash
    $ make run-all
```

  **Warning**: `EMAIL_URL` must be initialized.

- To update **FitTrackee**

```bash
    $ make stop-all
    $ make update migrate 
    $ make run-all  # after checking update and migration went well
```

- To run shell inside **Fittrackee** container (with virtualenv):

```bash
    $ make shell
```


Notes:
- **Important**: all uncommented [variables](https://samr1.github.io/FitTrackee/installation.html#environment-variables) present in .env must be initialized. Otherwise, the application may not start.
- If you just want to evaluate **FitTrackee**, ready to use docker files are available in **FitTrackee** repository (see [Documentation](https://samr1.github.io/FitTrackee/installation.html#docker)).
