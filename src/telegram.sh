#!/bin/bash
TELEGRAM_USER_ID="795239431"
TELEGRAM_BOT_TOKEN="7132093894:AAHK2t-gkHgAVLA49dWHsdGv-2uknNcTCZ8"
TIME=10

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $1%0A%0AProject:+$CI_PROJECT_NAME%0AJOB_STAGE:$CI_JOB_STAGE%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG%0ASTATUS:$CI_JOB_STATUS"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null