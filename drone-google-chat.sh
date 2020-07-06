
if [ -z $PLUGIN_IMAGE ]; then
  PLUGIN_IMAGE="https://goo.gl/aeDtrS"
fi

if [ -z $PLUGIN_URL ]; then 
  echo "Missing url"
  echo "set variable URL in .drone.yml"
  exit 1
fi

if [ -z ${PLUGIN_KEY} ]; then 
  echo "missing variable KEY"
  echo "set variable KEY in .drone.yml"
  exit 1
fi

if [ -z ${PLUGIN_TOKEN} ]; then 
  echo "missing token"
  echo "set variable TOKEN in .drone.yml"
  exit 1
fi

generate_post_data()
{
  cat <<EOF
{
   "cards":[
      {
         "header":{
            "title":"#$DRONE_BUILD_NUMBER - $DRONE_REPO_NAME",
            "subtitle":"commit: $DRONE_COMMIT_MESSAGE",
            "imageUrl":"$PLUGIN_IMAGE"
         },
         "sections":[
            {
               "widgets":[
                 {
                     "keyValue":{
                        "topLabel":"Author",
                        "content":"$DRONE_COMMIT_AUTHOR_NAME"
                     }
                  },
                                    {
                     "keyValue":{
                        "topLabel":"Branch",
                        "content":"$DRONE_COMMIT_BRANCH"
                     }
                  },
                  {
                     "keyValue":{
                        "topLabel":"Status",
                        "content":"$DRONE_BUILD_STATUS"
                     }
                  }

               ]
            }
         ]
      }
   ]
}

EOF
}

curl --silent --location --request POST \
  --header 'Content-Type: application/json' \
  --data "$(generate_post_data)" "${PLUGIN_URL}?key=${PLUGIN_KEY}&token=${PLUGIN_TOKEN}"
