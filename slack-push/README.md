# slack-push
This docker lets you easily push messages to slack.

We use it to push our server-status to slack (cronjob / CI).

```bash
docker run --rm -it superbuddy/slack-push HOOKURL CHANNEL UNAME ICON And this is the message
```